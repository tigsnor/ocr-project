package com.example.ocrproject.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;

public class Paint {
    public void draw(int x, int y, int w, int h, String fileFullpath) {
        Image image = null;
        Graphics g;

        try {
            image = ImageIO.read(new File(fileFullpath));
//            int width = image.getWidth();
//            int height = image.getHeight();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        BufferedImage newImage
//        BufferedImage newImage = new BufferedImage(image.getWidth(), image.getHeight(),BufferedImage.TYPE_INT_RGB);
        g = image.getGraphics();
        g.drawImage(image,0,0,null);
        g.drawRect(x,y,w,h);
        g.dispose();

        try {
        ImageIO.write((RenderedImage) image, "jpg", new File("C:\\KSBproject\\ocr-project\\src\\main\\webapp\\resources\\"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
