# PeatReview
Starting point for (rapid) review of peat 

You need to clone the repository (package development is in progress). To clone a project in RStudio follow these steps:
            
            Select File > New Project.. 
            
            Select to create a new project from Version Control
            
            Choose Git
            
            Provide the repository url: https://github.com/DrMattG/PeatReview.git
            
            Then create the project.
            

This will download all the code in the repository to your local system. You can then use the Targets functions to create the workflow:

 tar_manifest()
 
 tar_make()
 
 tar_visnetwork()
 
 tar_read("Agri_papers")


