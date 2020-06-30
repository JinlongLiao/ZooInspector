package org.zooui.inspector.inspector.util;

import java.net.URL;

/**
 * @author liaojinlong
 * @since 2020/6/30 16:16
 */
public class FileUtil {
    public static final URL resource = FileUtil.class.getResource("/");
    public static final String ROOT_PATH = resource.getPath() + "/";

    public static String getRootPath() {
        return ROOT_PATH;
    }

    public static URL getResourceUrl(String fileName) {
        return FileUtil.class.getResource(fileName);
    }

}
