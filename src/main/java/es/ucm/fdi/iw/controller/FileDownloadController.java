package es.ucm.fdi.iw.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
 
@Controller
@RequestMapping("download")
public class FileDownloadController {    
    /**
     * Method for handling file download request from client
     * @throws IOException 
     * @throws FileNotFoundException 
     */
    @RequestMapping(value="/showpdf" ,method = RequestMethod.POST)
    public RedirectView doDownload(@RequestParam("ckeditor_data") String ckeditor_data,
			HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session) throws FileNotFoundException, IOException{
    	// step 1
        Document document = new Document();
        // step 2
        PdfWriter writer = null;
        File f1;
        FileWriter fileWritter;
        BufferedWriter bw;
        try { 
            f1 = new File("in.html");
            if(!f1.exists()) {
               f1.createNewFile();
            } 
            fileWritter = new FileWriter(f1.getName(),true);
            bw = new BufferedWriter(fileWritter);
            bw.write(ckeditor_data);
            bw.close();
            System.out.println("Done");
         } catch(IOException e){
            e.printStackTrace();
         }
		try {
			writer = PdfWriter.getInstance(document, new FileOutputStream("pdf.pdf"));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // step 3
        document.open();
        // step 4
        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
                new FileInputStream("in.html")); 
        //step 5 
         document.close();
 
        System.out.println( "PDF Created!" );
        //step 6 -- borrar el html creado
		f1 = new File("in.html");

		if(f1.delete()){
			System.out.println(f1.getName() + " is deleted!");
		}else{
			System.out.println("Delete operation is failed.");
		}


        return new RedirectView("/curriculum?pdf=created");
    }
}
