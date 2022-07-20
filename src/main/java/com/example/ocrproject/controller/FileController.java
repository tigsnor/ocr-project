package com.example.ocrproject.controller;

import com.example.ocrproject.utils.Paint;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FileController {
    Paint paint = new Paint();
    //이미지 업로드후 확인하면 파이썬쪽으로 가게

    @PostMapping("/uploadImage")
    public void upload() {
        paint.draw(194,32,304,64,"C:/KSBproject/ocr-project/src/main/webapp/resources/img/ocrTest.jpg");
        //파이썬쪽으로 보내기
    }

    @GetMapping(value="/image/{filename}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Resource> picture(@PathVariable("filename") String filename){
//        String filename = request.getParameter("filename");
        String path = "C:/ocrImg/";

        Resource resource = new FileSystemResource(path + filename);

        if(!resource.exists()){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        HttpHeaders headers = new HttpHeaders();
        Path filePath = null;

        try{
            filePath = Paths.get(path + filename);
            headers.add("Content-Type", Files.probeContentType(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(resource, headers, HttpStatus.OK);

    }
}
