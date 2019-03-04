/**
 * 
 */
package org.dprime.biopoiesis;

import java.awt.AWTEvent;
import java.awt.EventQueue;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;

/**
 * @author carlos
 *
 */
public class BiopoiesisEventQueue extends EventQueue
{
	// Override this function to change behavior
	public void handleKey(String keydesc)
	{
		System.out.println("System Event: got key " + keydesc);
		if (keydesc.equals("esc")){
			System.exit(0);
		}
	}

	// Override this function to change behavior
	public void handleMouseMove(int x, int y)
	{
	}

    public void dispatchEvent(AWTEvent event)
    {
    	int id = event.getID();
        // Trap specified keys
        if (id == KeyEvent.KEY_PRESSED) {
            KeyEvent ke = (KeyEvent)event;
            if (ke.getKeyCode() == KeyEvent.VK_ESCAPE) {
                handleKey("esc");
            }
            else if (ke.getKeyCode() == KeyEvent.VK_F1 && ke.isControlDown()) {
                handleKey("ctrlF1");
            }
            else if (ke.getKeyCode() == KeyEvent.VK_F1) {
                handleKey("F1");
            }
            return;
        }
        else if (id == MouseEvent.MOUSE_MOVED) {
            MouseEvent me = (MouseEvent)event;
            if (me.getX() < 5 && me.getY() < 5) {
                handleMouseMove(me.getX(),me.getY());
            }
        }
        super.dispatchEvent(event);
    }
}
