# Code Snippets from Updating Fedora 3

The presentation is very important for this part as it walks through the steps in exporting and recreating the RELS-EXT. The Fedora Batch Modify language requires one to completely recreate the file that's being updated.

## Official Documentation of Fedora Batch Modify

This is the official documentation sample of a Fedora Batch Modify

	<?xml version="1.0" encoding="utf-8"?>
	<!--  **********************************************************************  -->
	<!--  This is a sample modify directives file that performs a variety of  -->
	<!--  modfications on the datastreams of two new demo  -->
	<!--  objects (demo:32 and demo:33) that the script will create. In general,  -->
	<!--  one should always validate a modify directives file against the  -->
	<!--  modifyBatch.xsd schema prior to processing to catch any syntax errors.  -->
	<!--  Processing will halt if the directives file is invalid and a log file  -->
	<!--  is generated summarizing the results of the batch. Refer to the xml  -->
	<!--  schema file (modifyBatch.xsd) for details on the syntax of the modify  -->
	<!--  file.  -->
	<!--  -->
	<!--  **********************************************************************  -->
	<fbm:batchModify xmlns:fbm="http://www.fedora.info/definitions/"
	                   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	                   xsi:schemaLocation="http://www.fedora.info/definitions/
	                                      http://www.fedora.info/definitions/1/0/api/batchModify.xsd">
	<!--  ******************************************************************  -->
	<!--  Add a new empty object to the repository that has no datastreams  -->
	<!--  with PID of demo:32.  -->
	<!--  -->
	<!--  NOTE: By default each Fedora repository specifies several PID  -->
	<!--  namespaces (e.g. "demo")that will be retained at ingest by the  -->
	<!--  repository allowing ingested objects to retain the PID specified  -->
	<!--  at ingest time. This list of PID namespaces is configurable in  -->
	<!--  fedora.fcfg using the retainPids config parameter. In this example,  -->
	<!--  demo:32 is specified PID so the generated object will retain this  -->
	<!--  PID value after ingestion. Leaving the pid attribute empty  -->
	<!--  (i.e., "") will force the repository to assign a PID to the new  -->
	<!--  object using the namespace specified by the PidNamespace parameter  -->
	<!--  in the fedora.fcf config file.  -->
	 
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object; leave blank if you want repository to  -->
	<!--  assign the pid.  -->
	<!--  label - label for the object  -->
	<!--  contentModel - content model of the object  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  *******************************************************************  -->
	<fbm:addObject pid="demo:32" label="Sample Object Used With Batch Modify Utility"
	               contentModel="Object" logMessage="BatchModify - addObject"/>
	<!--  ******************************************************************  -->
	<!--  Add a second new empty object to the repository that has no  -->
	<!--  datastreams with a PID of demo:33.  -->
	<!--  *******************************************************************  -->
	<fbm:addObject pid="demo:33" label="2nd Sample Object Used With Batch Modify Utility"
	               contentModel="Object" logMessage="BatchModify - addObject"/>
	<!--  ******************************************************************  -->
	<!--  Modify object demo:32 by changing the label on the object.  -->
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  -->
	<!--  Optional attributes on directive:  -->
	<!--  label - label for the object  -->
	<!--  state - state of the object  -->
	<!--  *******************************************************************  -->
	<fbm:modifyObject pid="demo:32" label="Object Label was changed" logMessage="BatchModify - modifyObject"/>
	<!--  ******************************************************************  -->
	<!--  Modify object demo:33 by changing its state to deleted.  -->
	<!--  *******************************************************************  -->
	<fbm:modifyObject pid="demo:33" state="D" logMessage="BatchModify - modifyObject  "/>
	<!--  ******************************************************************  -->
	<!--  Purge object demo:33 that was just created and modified.  -->
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object to be purged  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  -->
	<!--  Optional attributes on directive:  -->
	<!--  force - boolean indicating whether to purge the object if any  -->
	<!--  critical dependencies exist. A value of true will purge the object  -->
	<!--  regardless of any dependencies. A value of false will allow the  -->
	<!--  purge only if no dependencies exist. This parameter is currently  -->
	<!--  not implemented in the server.  -->
	<!--  *******************************************************************  -->
	<fbm:purgeObject pid="demo:33" logMessage="BatchModify - purgeObject"/>
	<!--  ******************************************************************  -->
	<!--  Add a new datastream to demo:32 object with ID of DS1.  -->
	<!--  -->
	<!--  Note: A dsID of DS1 is assigned by the server since no dsID is  -->
	<!--  specified on the directive and this is the first datastream in  -->
	<!--  this object.  -->
	<!--  -->
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object  -->
	<!--  dsLabel - label fo the datastream  -->
	<!--  dsMIME - MIME type of the datastream  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  dsState - state of the object  -->
	<!--  dsControlGroupType - control group type of the datastream  -->
	<!--  dsLocation - location of the datastream; for XMLMetadataDatastreams  -->
	<!--  dsLocation omit dsLocation or leave as blank. For all  -->
	<!--  other datastream types, it is required and must  -->
	<!--  denote the remote location of the datastream.  -->
	<!--  -->
	<!--  Optional attributes on directive:  -->
	<!--  dsID - ID of the datastream; omit or leave as blank if you want  -->
	<!--  repository to assign datastream ID.  -->
	<!--  formatURI - URI identifying the format of the datastream  -->
	<!--  versionable - boolean indicating whether datastream is versionable  -->
	<!--  altIDs - space delimited string of alternated identifiers for the  -->
	<!--  datastream. This info is currently maintained in the  -->
	<!--  object, but not acted on.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsLabel="Thorny's Coliseum thumbnail jpg image" dsMIME="image/jpeg"
	                   dsLocation="http://localhost:8080/demo/simple-image-demo/coliseum-thumb.jpg"
	                   dsControlGroupType="E" dsState="A" logMessage="BatchModify - addDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Add a 2nd datastream to demo:32 object. The new datastream will be  -->
	<!--  a medium resolution image and will be assigned a dsID of DS2 since  -->
	<!--  no dsID is specified and this is the second datastream for this  -->
	<!--  object.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsLabel="Thorny's Coliseum medium jpg image" dsMIME="image/jpeg"
	                   dsLocation="http://localhost:8080/demo/simple-image-demo/coliseum-medium.jpg"
	                   dsControlGroupType="E" dsState="A" logMessage="BatchModify - addDatastream  "/>
	<!--  ******************************************************************  -->
	<!--  Add a 3rd datastream to demo:32 object. The new datastream will be  -->
	<!--  a high resolution image and will be assigned a dsID of DS3 since  -->
	<!--  no dsID is specified and this is the third datastream for this  -->
	<!--  object.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsLabel="Thorny's Coliseum high jpg image" dsMIME="image/jpeg"
	                   dsLocation ="http://localhost:8080/demo/simple-image-demo/coliseum-high.jpg"
	                   dsControlGroupType="M" dsState="A" logMessage="BatchModify - addDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Add a 4th datastream to demo:32 object. The new datastream will be  -->
	<!--  a very high resolution image and will be assigned a dsID of DS4  -->
	<!--  since no dsID is specified and this is the fourth datastream for  -->
	<!--  this object.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsLabel="Thorny's Coliseum veryhigh jpg image" dsMIME="image/jpeg"
	                   dsLocation="http://localhost:8080/demo/simple-image-demo/coliseum-veryhigh.jpg"
	                   dsControlGroupType="M" dsState="A" logMessage="BatchModify - addDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Add a 5th datastream to demo:32 object. The new datastream will be  -->
	<!--  a screen size image and will have dsID of SCREEN. This datastream  -->
	<!--  will also have values assigned for alternate IDs, formatURI, and  -->
	<!--  is declared not to be versionable.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsID="SCREEN" altIDs="AlternateID1 AlternateID2"
	                   formatURI="info:fedora/demo/content/JPEG#" versionable="false"
	                   dsLabel="Thorny's Coliseum screen size jpg image" dsMIME="image/jpeg"
	                   dsLocation="http://localhost:8080/demo/simple-image-demo/coliseum-high.jpg"
	                   dsControlGroupType="E" dsState="A" logMessage="BatchModify - addDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Add a 6th datastream to demo:32 object. The new datastream will be  -->
	<!--  a user-defined inline descriptive metadata datastream and will  -->
	<!--  have dsID of DESC.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsID="DESC" dsLabel="Descriptive metadata for Thorny's Coliseum screen size jpg image"
	                   dsMIME="text/xml" dsControlGroupType="X" dsState="A" logMessage="BatchModify - addDatastream">
	<fbm:xmlData>
	<uvalibdesc:desc xmlns:uvalibdesc="http://dl.lib.virginia.edu/bin/dtd/descmeta/descmeta.dtd">
	<uvalibdesc:time>
	  <uvalibdesc:date type="created" certainty="ca." era="bc">1st century</uvalibdesc:date>
	</uvalibdesc:time>
	<uvalibdesc:identifier scheme="URN">uva-lib:2</uvalibdesc:identifier>
	<uvalibdesc:rights type="use">unrestricted</uvalibdesc:rights>
	<uvalibdesc:subject scheme="other" othertype="keyword">Roman Empire</uvalibdesc:subject>
	<uvalibdesc:subject scheme="other" othertype="keyword">Roman</uvalibdesc:subject>
	<uvalibdesc:subject scheme="other" othertype="keyword">Vespaciano</uvalibdesc:subject>
	<uvalibdesc:subject scheme="other" othertype="keyword">Amphitheatrum Flavium</uvalibdesc:subject>
	<uvalibdesc:title type="main">Coliseum -- Rome, Italy</uvalibdesc:title>
	<uvalibdesc:form>architecture</uvalibdesc:form>
	<uvalibdesc:mediatype type="image"><uvalibdesc:form>digital</uvalibdesc:form></uvalibdesc:mediatype>
	<uvalibdesc:agent role ="publisher">Alderman Library</uvalibdesc:agent>
	<uvalibdesc:covspace>
	  <uvalibdesc:geometry>
	    <uvalibdesc:point>
	      <uvalibdesc:lat>41.54N</uvalibdesc:lat><uvalibdesc:long>12.27E</uvalibdesc:long>
	    </uvalibdesc:point>
	  </uvalibdesc:geometry>
	</uvalibdesc:covspace>
	<uvalibdesc:covtime>
	  <uvalibdesc:date era="bc">72</uvalibdesc:date><uvalibdesc:date era ="bc">80</uvalibdesc:date>
	</uvalibdesc:covtime>
	<uvalibdesc:culture>Roman</uvalibdesc:culture>
	<uvalibdesc:place type="original"><uvalibdesc:geogname>Italy, Rome</uvalibdesc:geogname></uvalibdesc:place>
	</uvalibdesc:desc>
	</fbm:xmlData>
	</fbm:addDatastream>
	<!--  ******************************************************************  -->
	<!--  Add a 7th datastream to demo:32 object. The new datastream will be  -->
	<!--  duplicate of the screen size image that will be deleted later in  -->
	<!--  this set of directives. It will have a dsID of SCREENDUP.  -->
	<!--  ******************************************************************  -->
	<fbm:addDatastream pid="demo:32" dsID="SCREENDUP" dsLabel="Thorny's Coliseum screen size jpg image" dsMIME="image/jpeg"
	                   dsLocation="http://localhost:8080/demo/simple-image-demo/coliseum-high.jpg"
	                   dsControlGroupType="R" dsState="A" logMessage="BatchModify - addDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Modify datastream DS1 of demo:5 object by changing its label.  -->
	<!--  -->
	<!--  NOTE: Optional attributes that are omitted indicate that that  -->
	<!--  attribute is to remain uncahnged and the original value of of the  -->
	<!--  datastream attribute in the object will be preserved. Optional  -->
	<!--  attributes that are set to the empty string indicate that the  -->
	<!--  atrribute value will be blanked out in the datastream.  -->
	<!--  In this example the datastream location and state attributes are  -->
	<!--  not modified.  -->
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object  -->
	<!--  dsID - ID of the datastream  -->
	<!--  dsControlGroupType - control group type of the datastream  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  -->
	<!--  Optional attributes on directive:  -->
	<!--  dsLabel - label fo the datastream  -->
	<!--  dsState - state of the object  -->
	<!--  dsLocation - location of the datastream  -->
	<!--  dsMIME - MIME type of the datastream  -->
	<!--  formatURI - URI identifying the format of the datastream  -->
	<!--  versionable - boolean indicating whether datastream is versionable  -->
	<!--  altIDs - space delimited string of alternated identifiers for the  -->
	<!--  datastream. This info is currently maintained in the  -->
	<!--  object, but not acted on.  -->
	<!--  force - boolean indicating whether to purge the object if any  -->
	<!--  critical dependencies exist. A value of true will purge  -->
	<!--  the object regardless of any dependencies. A value of  -->
	<!--  false will allow the purge only if no dependencies exist.  -->
	<!--  ******************************************************************  -->
	<fbm:modifyDatastream pid="demo:32" dsID="DS1" dsControlGroupType="E"
	                      dsLabel="New label for datastream DS1"
	                      logMessage="BatchModify - modifyDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Modify datastream SCREEN of demo:32 object by changing its label  -->
	<!--  and datastream location so that it points to the same content as  -->
	<!--  that of datastream DS3 which is a high-res image.  -->
	<!--  -->
	<!--  NOTE: Optional attributes that are omitted indicate that that  -->
	<!--  attribute is to remain uncahnged and the original value of of the  -->
	<!--  datastream attribute in the object will be preserved. Optional  -->
	<!--  attributes that are set to the empty string indicate that the  -->
	<!--  attribute value will be blanked out in the datastream.  -->
	<!--  ******************************************************************  -->
	<fbm:modifyDatastream pid="demo:32" dsID="SCREEN" dsControlGroupType="E"
	                      dsLabel="Changed label for datastream SCREEN"
	                      dsLocation="http://localhost:8080/fedora/get/demo:5/DS4"
	                      logMessage="BatchModify - modifyDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Modify datastream DC of demo:32 object by changing its label and  -->
	<!--  its xml content so that its content is replaced by the block of  -->
	<!--  xml below.  -->
	<!--  ******************************************************************  -->
	<fbm:modifyDatastream pid="demo:32" dsID="DC" dsControlGroupType="X"
	                      dsLabel="New label for DC datastream"
	                      logMessage="BatchModify - modifyDatastream">
	<fbm:xmlData>
	  <oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	             xmlns:dc="http://purl.org/dc/elements/1.1/"
	             xmlns:my="http//foo.bar.none">
	    <dc:title>Coliseum in Rome</dc:title>
	    <dc:creator>Thornton Staples</dc:creator><dc:subject>Architecture, Roman</dc:subject>
	    <dc:description>Image of Coliseum in Rome</dc:description>
	    <dc:publisher>University of Virginia Library</dc:publisher>
	    <dc:format>image/jpeg</dc:format>
	    <dc:identifier>demo:5</dc:identifier>
	    <my:this>some text</my:this>
	    <my:that>some more text</my:that>
	    <my:other>even more text</my:other>
	  </oai_dc:dc>
	</fbm:xmlData>
	</fbm:modifyDatastream>
	<!--  ******************************************************************  -->
	<!--  Modify datastream DESC of demo:32 object by changing its label.  -->
	<!--  Also change its formatURI and set versionable to false.  -->
	<!--  ******************************************************************  -->
	<fbm:modifyDatastream pid="demo:32" dsID="DESC" dsControlGroupType="X"
	                      dsLabel="New label for DC datastream" formatURI="info:fedora/new/formatURI"
	                      versionable="false"logMessage="BatchModify - modifyDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Purge datastream SCREENDUP from object demo:32  -->
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object to be purged  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  -->
	<!--  Optional attributes on directive:  -->
	<!--  force - boolean indicating whether to purge the object if any  -->
	<!--  critical dependencies exist. A value of true will purge  -->
	<!--  the object regardless of any dependencies. A value of  -->
	<!--  false will allow the purge only if no dependencies exist.  -->
	<!--  purge only if no dependencies exist. This parameter is  -->
	<!--  currently not implemented in the server.  -->
	<!--  ******************************************************************  -->
	<fbm:purgeDatastream pid="demo:32" dsID="SCREENDUP" logMessage="BatchModify - purgeDatastream"/>
	<!--  ******************************************************************  -->
	<!--  Change the state of datastream DS1 to deleted  -->
	<!--  -->
	<!--  Required attributes on directive:  -->
	<!--  pid - PID of the object  -->
	<!--  dsID - ID of the datastream  -->
	<!--  dsState - new value for state of the datastream  -->
	<!--  logMessage - message to be written in audit trail record  -->
	<!--  ******************************************************************  -->
	<fbm:setDatastreamState pid="demo:32" dsID="DS1" dsState="D" logMessage ="BatchModify - setDatastreamState"/>
	<!--  ******************************************************************  -->
	<!--  Change the state of datastream DESC to inactive  -->
	<!--  ******************************************************************  -->
	<fbm:setDatastreamState pid="demo:32" dsID="DESC" dsState="I" logMessage="BatchModify - setDatastreamState"/>
	</fbm:batchModify>

## Regex Samples to Create Fedora Batch Modify

Add general XML declaration and overall wrapper of `<fbm:batchModify xmlns:fbm="http://www.fedora.info/definitions/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.fedora.info/definitions/ http://www.fedora.info/definitions/1/0/api/batchModify.xsd">`. But the XMLNS declarations have to be done somewhere within the xml data being added. Once all the Regex transformations are done, the file will become valid (until then, it'll have invalid data because it's in the CSV format)

**Sample Data:**

This example has 2 authors and 2 subcollections"

	gsfcirCollq:2948	subcollection:2, subcollection:6	gsfcirGaca:284759384, gsfcirGaca:005784568

**Find:**

	(gsfcirCollq:\d{1,4})\t(subcollection:\d{1,2}), (subcollection:\d{1,2})\t(gsfcirGaca:\d{9}), (gsfcirGaca:\d{9})

**Replace:**

	<fbm:modifyDatastream pid="\1" dsID="RELS-EXT" dsControlGroupType="X" dsLabel="colloquia_RELS-EXT_ds" logMessage="BatchModify - modifyDatastream">
	<fbm:xmlData>
	  <rdf:RDF xmlns:rel="info:fedora/fedora-system:def/relations-external#" xmlns:fedora-model="info:fedora/fedora-system:def/model#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	    <rdf:Description rdf:about="\1">
	      <rel:isMemberOfCollection rdf:resource="info:fedora/collection:3"/>
	      <rel:isMemberOf rdf:resource="\2"/>
	      <rel:isMemberOf rdf:resource="\3"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:2"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:4"/>
	      <rel:isPartOf rdf:resource="\4"/>
	      <rel:isPartOf rdf:resource="\5"/>
	    </rdf:Description>
	  </rdf:RDF>
	</fbm:xmlData>
	</fbm:modifyDatastream>

Repeat using variations for number of subcollections and authors. Simply involves adding more comma-separated items and ensuring backreferences are correct.

## Example Update Using Fedora Batch Modify

This is what the final data looked like:

	<?xml version="1.0" encoding="utf-8"?>
	<fbm:batchModify xmlns:fbm="http://www.fedora.info/definitions/"
	                   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	                   xsi:schemaLocation="http://www.fedora.info/definitions/
	                                      http://www.fedora.info/definitions/1/0/api/batchModify.xsd">
	<fbm:modifyDatastream pid="gsfcirCollq:4147" dsID="RELS-EXT" dsControlGroupType="X" dsLabel="colloquia_RELS-EXT_ds" logMessage="BatchModify - modifyDatastream">
	<fbm:xmlData>
	  <rdf:RDF xmlns:rel="info:fedora/fedora-system:def/relations-external#" xmlns:fedora-model="info:fedora/fedora-system:def/model#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	    <rdf:Description rdf:about="info:fedora/gsfcirCollq:4147">
	      <rel:isMemberOfCollection rdf:resource="info:fedora/collection:3"/>
	      <rel:isMemberOf rdf:resource="info:fedora/subcollection:3"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:2"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:4"/>
	      <rel:isPartOf rdf:resource="info:fedora/gsfcirGaca:003787401"/>
	    </rdf:Description>
	  </rdf:RDF>
	</fbm:xmlData>
	</fbm:modifyDatastream>
	<fbm:modifyDatastream pid="gsfcirCollq:1553" dsID="RELS-EXT" dsControlGroupType="X" dsLabel="colloquia_RELS-EXT_ds" logMessage="BatchModify - modifyDatastream">
	<fbm:xmlData>
	  <rdf:RDF xmlns:rel="info:fedora/fedora-system:def/relations-external#" xmlns:fedora-model="info:fedora/fedora-system:def/model#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	    <rdf:Description rdf:about="info:fedora/gsfcirCollq:1553">
	      <rel:isMemberOfCollection rdf:resource="info:fedora/collection:3"/>
	      <rel:isMemberOf rdf:resource="info:fedora/subcollection:4"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:2"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:4"/>
	      <rel:isPartOf rdf:resource="info:fedora/gsfcirGaca:024458913"/>
	    </rdf:Description>
	  </rdf:RDF>
	</fbm:xmlData>
	</fbm:modifyDatastream>
	<fbm:modifyDatastream pid="gsfcirCollq:3887" dsID="RELS-EXT" dsControlGroupType="X" dsLabel="colloquia_RELS-EXT_ds" logMessage="BatchModify - modifyDatastream">
	<fbm:xmlData>
	  <rdf:RDF xmlns:rel="info:fedora/fedora-system:def/relations-external#" xmlns:fedora-model="info:fedora/fedora-system:def/model#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	    <rdf:Description rdf:about="info:fedora/gsfcirCollq:3887">
	      <rel:isMemberOfCollection rdf:resource="info:fedora/collection:3"/>
	      <rel:isMemberOf rdf:resource="info:fedora/subcollection:6"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:2"/>
	      <fedora-model:hasModel rdf:resource="info:fedora/cmodel:4"/>
	      <rel:isPartOf rdf:resource="info:fedora/gsfcirGaca:024458913"/>
	      <rel:isPartOf rdf:resource="info:fedora/gsfcirGaca:830719645"/>
	    </rdf:Description>
	  </rdf:RDF>
	</fbm:xmlData>
	</fbm:modifyDatastream>
	</fbm:batchModify>