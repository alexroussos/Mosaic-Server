package mosaic;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.imageio.ImageIO;

import mosaic.*;
import mosaic.palettegenerator.ImageBasedColorPaletteGenerator;

public class MosaicServlet extends HttpServlet {

	// TODO include mosaic generator as sub-module - http://git-scm.com/book/en/Git-Tools-Submodules

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String imgUrl = req.getParameter("imgUrl");
        
        /*
         * Here's a URL that was breaking things -- encoding spaces fixes most but eventually do something more complete.
         *  http://4.bp.blogspot.com/-If90I32Opu8/UTSRyKKi3OI/AAAAAAAAE8U/chZ2iWNNF7M/s1600/plaid+mash+stamp+ciate+fade+to+greige+china+glaze+split+perso-nail-ity.JPG?blah blah=3 4
         */
        imgUrl = imgUrl.replaceAll(" ", "%20"); 
        
        System.out.println("MosaicServlet: Got image " + imgUrl); // TODO real logging
        
        MosaicGenerator mosaicGenerator = new MosaicGenerator();
        BufferedImage rawImage = ImageIO.read(new URL(imgUrl));
        
        List<Integer> colorCounts = new ArrayList<Integer>(Arrays.asList(new Integer[] { 6, 12, 24 }));
        List<Integer> widths = new ArrayList<Integer>(Arrays.asList(new Integer[] { 50, 100, 200 }));
        
        
        // Override if param was provided
        String c = req.getParameter("colors");
        if (c != null) {
        	colorCounts = getArgAsList(c);
        }
        String d = req.getParameter("dims");
        if (d != null) {
        	widths = getArgAsList(d);
        }
        
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
	
    private static List<Integer> getArgAsList(String args) {
    	List<Integer> list = new ArrayList<Integer>();
    	for (String arg : args.split(",")) {
    		list.add(Integer.parseInt(arg.trim()));
    	}
    	return list;
    }
}
