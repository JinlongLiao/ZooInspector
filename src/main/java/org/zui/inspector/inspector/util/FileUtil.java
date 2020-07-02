package org.zui.inspector.inspector.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.net.URL;
import java.util.Objects;

/**
 * @author liaojinlong
 * @since 2020/6/30 16:16
 */
public class FileUtil {
    private static final Logger log = LoggerFactory.getLogger(FileUtil.class);

    public static final URL resource = FileUtil.class.getResource("/");
    public static final String ROOT_PATH;

    static {
        ROOT_PATH = Objects.isNull((System.getenv("ZUI_ROOT_PATH"))) ?
                (resource.getPath() + File.separator) :
                (System.getenv("ZUI_ROOT_PATH")) + File.separator + "conf/";
        if (Objects.isNull(ROOT_PATH)) {
            log.error("ZUI_ROOT_PATH 未配置，脚本存在问题");
            System.exit(-1);
        }
        log.info("系统根目录：{}", ROOT_PATH);
    }

    public static String getRootPath() {
        return ROOT_PATH;
    }

    public static String appendRootPath(String fileName) {
        return ROOT_PATH + fileName;
    }

}
