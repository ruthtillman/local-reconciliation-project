# Creating the Local Recon Service in FOAF

If you have the names in the form you want, you may want to import your data into OpenRefine, create an RDF skeleton, and then export from there. In my case, what I was working on was so simple and I had to manipulate it anyway with Regex so I cut out a step and created the SPARQL file in the process.

I chose [Friend of a Friend](http://xmlns.com/foaf/spec/) because it the RDF plugin supports it as one of the defaults and it suited my simple purposes. 

## Sample Export and Regexes

Sample data:

	"Tillman, Ruth K.", gsfcirGaca:294839405

Find: 

	("(.+?),(\sDr.\s|\s{2}|\s))(.+?)(\s(\w\.)"|"),gsfcirGaca:(\d{9})

Replace:

	<http://gsfcir.gsfc.nasa.gov/authors/id/\7> a foaf:Person;\n  foaf:name "\2, \4", "\2, \4 \6".\n\n

For authors which didn't have a middle initial, you'll end up with double names. The second name has a space on the end. It doesn't hurt the reconciliation, but it's not good data. So I performed this next:

Find:

	foaf:name "(.+?)", "\1 ".

Replace:

	foaf:name "\1".


#Output, a FOAF-based SPARQL file

Add prefixes to the file's head:

	@prefix rdf: 	<http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
	@prefix rdfs: 	<http://www.w3.org/2000/01/rdf-schema#> .
	@prefix xsd: 	<http://www.w3.org/2001/XMLSchema#> .							
	@prefix foaf:    <http://xmlns.com/foaf/0.1/> .

	<http://gsfcir.gsfc.nasa.gov/authors/id/294839405> a foaf:Person;
	  foaf:name "Tillman, Ruth", "Tillman, Ruth K.".
	<http://gsfcir.gsfc.nasa.gov/authors/id/823462024> a foaf:Person;
	  foaf:name "Atlas, David".
	<http://gsfcir.gsfc.nasa.gov/authors/id/411735411> a foaf:Person;
	  foaf:name "Tilton, James", "Tilton, James C.".
	<http://gsfcir.gsfc.nasa.gov/authors/id/868841903> a foaf:Person;
	  foaf:name "Esaias, Wayne", "Esaias, Wayne E.".
