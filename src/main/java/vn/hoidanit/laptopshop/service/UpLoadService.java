package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UpLoadService {
    private final ServletContext servletContext;
    public UpLoadService(ServletContext servletContext){
        this.servletContext = servletContext;
    }

    public String handleUpLoadFile(MultipartFile file, String targetFolder ){
        if (file.isEmpty()){
            return "";
        }
        String roothPath = this.servletContext.getRealPath("resources/images");
        String finalName ="";
        try {
        byte[] bytes = file.getBytes();

        File dir = new File (roothPath + File.separator + targetFolder);

        if(!dir.exists()){
            dir.mkdirs();
        }
        finalName = System.currentTimeMillis()+"-"+file.getOriginalFilename();

        File serverFile = new File(dir.getAbsolutePath()+ File.separator + finalName );

        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
        stream.write(bytes);
        stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return finalName;
    }

}
