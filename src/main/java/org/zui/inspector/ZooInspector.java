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
package org.zui.inspector;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.UIManager;

import org.zui.inspector.inspector.gui.ZooInspectorPanel;
import org.zui.inspector.inspector.manager.ZooInspectorManagerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author CGSmithe
 */
public class ZooInspector {
    private static final Logger logger = LoggerFactory.getLogger(ZooInspector.class);

    /**
     * @param args
     */
    public static void main(String[] args) {
        System.out.println("  ____         ___                      _           ");
        System.out.println(" _  /___  ___|_ _|_ _  ____ __  ___ __| |_ ___ _ _  ");
        System.out.println("  / // _ \\/ _ \\| || ' \\(_-< '_ \\/ -_) _|  _/ _ \\ '_|");
        System.out.println(" /___\\___/\\___/___|_||_/__/ .__/\\___\\__|\\__\\___/_|  ");
        System.out.println("                         |_|                        ");

        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            JFrame frame = new JFrame("ZooInspector");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            final ZooInspectorPanel zooInspectorPanel = new ZooInspectorPanel(
                    new ZooInspectorManagerImpl());
            frame.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    super.windowClosed(e);
                    zooInspectorPanel.disconnect(true);
                }
            });

            frame.setContentPane(zooInspectorPanel);
            frame.setSize(1024, 768);
            frame.setVisible(true);
        } catch (Exception e) {
            logger.error("Error occurred loading ZooInspector", e);
            JOptionPane.showMessageDialog(null, "ZooInspector failed to start: " + e.getMessage(),
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
