#!/usr/bin/env python
# ORE/Open Rating Environment - $Id: autolicense.py,v 1.1 2004/12/20 19:33:01 skandalfo Exp $
# Copyright (C) 2004 Juan J. Garcia de Soria.
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# 
# ((autolicense)) 
import sys
import os
import os.path

license = [
"ORE/Open Rating Environment - $Id: autolicense.py,v 1.1 2004/12/20 19:33:01 skandalfo Exp $\n",
"Copyright (C) 2004 Juan J. Garcia de Soria.\n",
"\n",
"This program is free software; you can redistribute it and/or\n",
"modify it under the terms of the GNU Lesser General Public\n",
"License as published by the Free Software Foundation; either\n",
"version 2.1 of the License, or (at your option) any later version.\n",
"\n",
"This program is distributed in the hope that it will be useful,\n",
"but WITHOUT ANY WARRANTY; without even the implied warranty of\n",
"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\n",
"Lesser General Public License for more details.\n",
"\n",
"You should have received a copy of the GNU Lesser General Public\n",
"License along with this library; if not, write to the Free Software\n",
"Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA\n",
"\n"
]

preComment = {
	".c": "/*"
}

postComment = {
	".c": "*/"
}

ignoreComment = {
	".sh": "#!",
	".py": "#!"
}
	
lineComment = {
	".sql": "-- ",
	".py": "# ",
	".cpp": "// ",
	".java": "// ",
	".sh": "# "
}

def licensify(file):
	global preComment, lineComment, postComment, ignoreComment
	(root, ext) = os.path.splitext(file)
	preC = ""
	postC = ""
	ignoreC = ""
	lineC = ""

	if lineComment.has_key(ext):
		lineC = lineComment[ext]
	if preComment.has_key(ext):
		preC = preComment[ext]
	if postComment.has_key(ext):
		postC = postComment[ext]
	if ignoreComment.has_key(ext):
		ignoreC = ignoreComment[ext]
	
	if preC == "" and postC == "" and lineC == "":
		sys.stderr.write("I don't know how to comment file %s.\n" % (file))
		sys.exit(1)
	
	f = open(file, "rt")
	lines = f.readlines()
	f.close()

	preamble = []
	if ignoreC != "":
		while len(lines) > 0 and lines[0].startswith(ignoreC):
			preamble.append(lines[0])
			del lines[0]
	
	eolm = lineC + "((autolicense)) " + postC + "\n"

	try:
		i = lines.index(eolm)
		lines = lines[i + 1 :]
	except ValueError:
		pass
	
	if preC != "":
		preamble.append(preC + "\n")
	
	licenseC = []
	for ll in license:
		licenseC.append(lineC + ll)

	output = preamble + licenseC + [eolm] + lines

	f = open(file, "wt")
	f.writelines(output)
	f.close()

for file in sys.argv:
	licensify(file)

