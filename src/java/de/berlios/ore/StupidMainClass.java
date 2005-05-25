/*
 * StupidMainClass.java
 *
 * Created on 23 de enero de 2005, 20:21
 */

package de.berlios.ore;

import org.objectweb.jotm.Jotm;
import org.objectweb.transaction.jta.TMService;

/**
 *
 * @author skandalfo
 */
public class StupidMainClass {
    
    public static void main(String [] args) {
        System.out.println("Oh! What a stupid class I am...");
        try {
        	TMService jotm = new Jotm(true, true);
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
    }
    
}
