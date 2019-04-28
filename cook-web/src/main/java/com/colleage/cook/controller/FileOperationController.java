package com.colleage.cook.controller;

import com.colleage.cook.constants.SessionAttributeKeyConstants;
import com.colleage.cook.utils.constants.FileStorePathConstants;
import com.colleage.cook.utils.upload.impl.FileRepoImpl;
import com.colleage.cook.vo.SimpleUserInfo;
import com.colleage.cook.vo.WebResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Classname FileOperationController
 * @Description 文件操作访问接口
 * @Date 2019\4\25 0025
 * @Created by David
 */
@Api(value = "文件操作访问", description = "用于向系统中上传文件，目前用户上传用户头像和菜谱图片")
@RequestMapping("fo")
@RestController
public class FileOperationController {

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "img", value = "头像文件", paramType = "form", dataType="file", required = true)
            })
    @ApiOperation(value = "上传用户头像", httpMethod = "POST")
    @PostMapping("uploadAvatar.do")
    public WebResponseData uploadAvatar(HttpServletRequest request, @RequestParam(value = "img") MultipartFile file) {
        int userId = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER)).getId();
        String savePath = FileStorePathConstants.AVADIR + FileRepoImpl.getAvaPath(userId, 100);
        return doUpload(file, savePath);
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "img", value = "菜谱图片", paramType = "form", dataType="file", required = true)
            })
    @ApiOperation(value = "上传菜谱图片", httpMethod = "POST")
    @PostMapping("uploadMenuImg.do")
    public WebResponseData uploadMenuImg(@RequestParam(value = "img") MultipartFile file) {
        String name = file.getOriginalFilename();
        String suffix;
        if (name.indexOf("_") > 0 && name.indexOf("_") < name.lastIndexOf(".")) {
            suffix = name.substring(name.indexOf("_"));
        } else {
            suffix = name.substring(name.indexOf("."));
        }
        String savePath = FileStorePathConstants.APP_CONTEXT_IMG + File.separator + UUID.randomUUID().toString().replace("-", "") + suffix;
        return doUpload(file, savePath);
    }

    private WebResponseData doUpload(MultipartFile file, String savePath) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            if (file.isEmpty()) {
                webResponseData.setCode(WebResponseData.Code.ERROR);
                webResponseData.setMessage(WebResponseData.Message.UPLOAD_FILE_NOT_NULL);
                return webResponseData;
            }

            String targetPath = new File(ResourceUtils.getURL("classpath:").getPath()).getAbsolutePath();
//            String javaPath = ResourceUtils.getURL("cook-web/src/main/resources").getPath();
            File dest = new File(targetPath, savePath);

            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();
            }
            file.transferTo(dest);

            //加水印部分
//            File temp = new File(targetPath, FileStorePathConstants.TEMPDIR+File.separator+file.getOriginalFilename());
//            if (!temp.getParentFile().exists()) {
//                temp.getParentFile().mkdirs();
//            }
//            file.transferTo(temp);
//            ImageUtils.mark(temp.getAbsolutePath(), dest.getAbsolutePath(), "爱厨房");

            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
            webResponseData.setData(savePath);
            return webResponseData;
        } catch (IOException e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.TRANSFER_FILE_ERROR);
            return webResponseData;
        }
    }
}
