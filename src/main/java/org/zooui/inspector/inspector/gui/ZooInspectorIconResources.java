/*
 * ZooInspector
 * 
 * Copyright 2010 Colin Goodheart-Smithe

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 */
package org.zooui.inspector.inspector.gui;

import org.zooui.inspector.inspector.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.swing.ImageIcon;

/**
 * @author CGSmithe
 */
public class ZooInspectorIconResources {
    private static final Logger logger = LoggerFactory.getLogger(ZooInspectorIconResources.class);

    /**
     * @return file icon
     */
    public static ImageIcon getTreeLeafIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/file_obj.gif"); //$NON-NLS-1$
    }

    /**
     * @return folder open icon
     */
    public static ImageIcon getTreeOpenIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/fldr_obj.gif");
        //$NON-NLS-1$
    }

    /**
     * @return folder closed icon
     */
    public static ImageIcon getTreeClosedIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/fldr_obj.gif"); //$NON-NLS-1$
    }

    /**
     * @return connect icon
     */
    public static ImageIcon getConnectIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/launch_run.gif"); //$NON-NLS-1$
    }

    /**
     * @return disconnect icon
     */
    public static ImageIcon getDisconnectIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/launch_stop.gif"); //$NON-NLS-1$
    }

    /**
     * @return save icon
     */
    public static ImageIcon getSaveIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/save_edit.gif"); //$NON-NLS-1$
    }

    /**
     * @return add icon
     */
    public static ImageIcon getAddNodeIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/new_con.gif"); //$NON-NLS-1$
    }

    /**
     * @return delete icon
     */
    public static ImageIcon getDeleteNodeIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/trash.gif"); //$NON-NLS-1$
    }

    /**
     * @return refresh icon
     */
    public static ImageIcon getRefreshIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/refresh.gif"); //$NON-NLS-1$
    }

    /**
     * @return information icon
     */
    public static ImageIcon getInformationIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/info_obj.gif"); //$NON-NLS-1$
    }

    /**
     * @return node viewers icon
     */
    public static ImageIcon getChangeNodeViewersIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/edtsrclkup_co.gif"); //$NON-NLS-1$
    }

    /**
     * @return up icon
     */
    public static ImageIcon getUpIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/search_prev.gif"); //$NON-NLS-1$
    }

    /**
     * @return down icon
     */
    public static ImageIcon getDownIcon() {
        return new ImageIcon(FileUtil.getRootPath()+"icons/search_next.gif"); //$NON-NLS-1$
    }
}
