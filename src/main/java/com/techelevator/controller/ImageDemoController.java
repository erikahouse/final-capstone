package com.techelevator.controller;

import com.techelevator.services.uploads.UploadProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ImageDemoController
{
    private UploadProvider uploadProvider;

    @Autowired
    public ImageDemoController(UploadProvider uploadProvider)
    {
        this.uploadProvider = uploadProvider;
    }

    @RequestMapping(value="/upload", method = RequestMethod.GET)
    public String uploadImage()
    {
        return "demos/upload";
    }

    @RequestMapping(value="/upload", method = RequestMethod.POST)
    public String uploadImage( @RequestParam(required = false) MultipartFile file, HttpServletRequest request, int id)
    {
        //save restaurant without image and get the restaurantid

        if(file != null && !file.isEmpty())
        {
            try
            {
                //come up with a file name first
                String defaultFileName = "brewery_#" + String.valueOf(id);// should be the resaurant id


                //save the file with the chosen name
                String fileName = uploadProvider.uploadFile( file, defaultFileName );

            }
            catch(Throwable ex)
            {

            }
        }

        return "demos/upload";
    }

}
