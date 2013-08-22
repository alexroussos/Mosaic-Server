package mosaic;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mosaic.*;
import mosaic.palettegenerator.ImageBasedColorPaletteGenerator;

public class MosaicServlet extends HttpServlet {

	// TODO include mosaic generator as sub-module - http://git-scm.com/book/en/Git-Tools-Submodules

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String imgUrl = req.getParameter("imgUrl");
        
        System.out.println("Got image " + imgUrl);
        
        MosaicGenerator mosaicGenerator = new MosaicGenerator();
        BufferedImage rawImage = ImageIO.read(new URL(imgUrl));

        List<Integer> colorCounts = new ArrayList<Integer>(Arrays.asList(new Integer[] { 6, 12, 24 }));
        List<Integer> widths = new ArrayList<Integer>(Arrays.asList(new Integer[] { 50, 100, 200 }));
        
        BufferedImage mosaic = mosaicGenerator.generateCompositeMosaic(rawImage, colorCounts, widths, new ImageBasedColorPaletteGenerator(rawImage));

        // http://stackoverflow.com/questions/1154254/help-getting-image-from-servlet-to-jsp-page
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(mosaic, "png", baos);
        baos.flush();
        byte[] imageBytes = baos.toByteArray();
        baos.close();
        resp.setContentType("image/png");
        resp.setContentLength(imageBytes.length);
        resp.getOutputStream().write(imageBytes);
    }
	
    public void displayImage(HttpServletResponse resp) throws Exception {
        
        //GET IMAGE FULL PATH.
        ServletContext sc       = getServletContext();
        String         filename = sc.getRealPath("test.jpg");
        
        //GET IMAGE MIME TYPE.
        String mimeType = "image/jpeg";
        
        //SET CONTENT TYPE.
        resp.setContentType(mimeType);
        
        //SET CONTENT SIZE.
        File file = new File(filename);
        resp.setContentLength((int)file.length());
        
        //OPEN IMAGE & OUTPUT STREAM.
        FileInputStream in  = new FileInputStream(file);
        OutputStream    out = resp.getOutputStream();
        
        //COPY IMAGE TO OUTPUT STREAM.
        byte[]  buf   = new byte[1024];
        int     count = 0;
        while ((count = in.read(buf)) >= 0) {
          out.write(buf, 0, count);
        }  
      
      }
}
