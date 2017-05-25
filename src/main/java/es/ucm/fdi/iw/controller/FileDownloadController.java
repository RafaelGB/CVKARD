package es.ucm.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

import es.ucm.fdi.iw.LocalData;
 
@Controller
@RequestMapping("download")
public class FileDownloadController {    
	
	
	private static Logger log = Logger.getLogger(FileDownloadController.class);
	
	@Autowired
	private LocalData localData;
    /**
     * Method for handling file download request from client
     * @throws IOException 
     * @throws FileNotFoundException 
     */
    @RequestMapping(value="/showpdf/{id}" ,method = RequestMethod.POST)
    public ResponseEntity<InputStreamResource> doDownload(@RequestParam("ckeditor_data") String ckeditor_data,
    		@PathVariable("id") String id,HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session) throws FileNotFoundException, IOException{
    	// step 1 -- inicialización del documento
    	String urlget = "pdf=error+al+crear+el+documento";
        Document document = new Document();
        // step 2 --creación de los ficheros necesarios
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
            writer = PdfWriter.getInstance(document, new FileOutputStream(localData.getFile("user/"+id, "CV.pdf")));
            urlget="pdf=created";
         } catch(IOException e){
            e.printStackTrace();		
         } catch (DocumentException e) {
			e.printStackTrace();
         }
        // step 3 -- abro el documento
        document.open();
        // step 4 --parseo de html a pdf
        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
                new FileInputStream("in.html")); 
        //step 5 --cierro el documento
         document.close();

        //step 6 -- borrar el html creado
		f1 = new File("in.html");

		if(f1.delete()){
			log.info(f1.getName() + " is deleted!\n");
		}else{
			log.error("Delete operation is failed.\n");
		}

		//step 7 -- proceso de descarga del PDF
		f1 = localData.getFile("user/"+id, "CV.pdf");
		HttpHeaders respHeaders = new HttpHeaders();

	    respHeaders.setContentType(MediaType.parseMediaType("application/pdf"));
	    respHeaders.setContentDispositionFormData("attachment", "CV.pdf");
	    InputStreamResource isr = new InputStreamResource(new FileInputStream(f1));
	    return new ResponseEntity<InputStreamResource>(isr, respHeaders, HttpStatus.OK);
    }
}
