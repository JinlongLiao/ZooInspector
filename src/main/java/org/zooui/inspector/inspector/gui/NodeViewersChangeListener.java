/**
 * 
 */
package org.zooui.inspector.inspector.gui;

import java.util.List;

import org.zooui.inspector.inspector.gui.nodeviewer.ZooInspectorNodeViewer;

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
