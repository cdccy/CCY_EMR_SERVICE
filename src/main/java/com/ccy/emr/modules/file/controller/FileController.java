package com.ccy.emr.modules.file.controller;

import com.ccy.emr.common.result.Result;
import com.ccy.emr.modules.file.service.MinioService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

/**
 * 文件上传控制器
 *
 * @author CCY
 * @date 2026-01-27
 */
@Slf4j
@RestController
@RequestMapping("/file")
@RequiredArgsConstructor
@Tag(name = "文件管理", description = "文件上传、下载相关接口")
public class FileController {

    private final MinioService minioService;

    /**
     * 上传文件
     */
    @PostMapping("/upload")
    @Operation(summary = "上传文件", description = "上传单个文件到 MinIO")
    public Result<Map<String, String>> upload(@RequestParam("file") MultipartFile file) {
        log.info("上传文件: {}, 大小: {}", file.getOriginalFilename(), file.getSize());

        String url = minioService.uploadFile(file);

        Map<String, String> result = new HashMap<>();
        result.put("url", url);
        result.put("filename", file.getOriginalFilename());

        return Result.ok(result);
    }

    /**
     * 删除文件
     */
    @DeleteMapping("/delete")
    @Operation(summary = "删除文件", description = "根据对象名称删除文件")
    public Result<Void> delete(@RequestParam("objectName") String objectName) {
        log.info("删除文件: {}", objectName);
        minioService.deleteFile(objectName);
        return Result.ok();
    }
}
