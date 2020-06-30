/**
 * 
 */
package org.zui.inspector.inspector.gui;

import java.util.List;

import org.zui.inspector.inspector.gui.nodeviewer.ZooInspectorNodeViewer;

/**
 * @author CGSmithe
 * 
 */
public interface NodeViewersChangeListener
{
	/**
	 * @param newViewers
	 */
	public void nodeViewersChanged(List<ZooInspectorNodeViewer> newViewers);
}
