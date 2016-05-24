# Pull It Together! 

The project was published in Code4Lib Journal, as [Extracting, Augmenting, and Updating Metadata in Fedora 3 and 4 Using a Local OpenRefine Reconciliation Service](http://journal.code4lib.org/articles/11179). These supporting files, links, and presentations have been used to share the workflow process in other contexts.

## As Presented at Ohio Valley Group of Technical Services Librarians 2016 Conference

* [Presentation PPTX](/OVGTSL/Pull-It-Together-OVGTSL-2016-05-26.pptx)
* [Presentation PDF](/OVGTSL/Pull-It-Together-OVGTSL-2016-05-26.pdf)

## As Presented at Fedora User Group

Presentation delivered at the DC area Fedora User Group Meeting on October 8, 2015. Presentation and PDF both have full text of presentation.

* [Presentation PPTX](/Fedora-User-Group/Pull-It-Together-FUG-2015-10-08.pptx)
* [Presentation PDF](/Fedora-User-Group/Pull-It-Together-FUG-2015-10-08.pdf)

## Files

* [creating-foaf-file.md](/creating-foaf-file.md) &mdash; Steps used to create the FOAF SPARQL file which I then added as a service in OpenRefine.
* [colloquia-gsearch-to-csv.xslt](/colloquia-gsearch-to-csv.xslt) &mdash; Transformation of colloquia gsearch export into CSV of each PID, Name, Date, Title (one entry per name/PID combo). Date/Title not necessary for reconciliation, just helpful for making choices in reconciliation.
* [fedora-3-update.md](/fedora-3-update.md) &mdash; XML samples demonstrating Fedora Batch Modify, sample TSV data, and commands used on sample data to create FBM files.
* [fedora-4-update.md](/fedora-4-update.md) &mdash; Steps to take TSV data and move it into SPARQL-update commands in cURL PATCHes.

## Tools Used

* [OpenRefine on GitHub](https://github.com/OpenRefine) or [OpenRefine](http://openrefine.org/)
* [DERI RDF Refine plugin for OpenRefine](http://refine.deri.ie/)
* [Sublime Text (trial version available)](http://www.sublimetext.com/)
* [cURL](http://curl.haxx.se/)
* [Postman - Chrome only](https://www.getpostman.com/)
