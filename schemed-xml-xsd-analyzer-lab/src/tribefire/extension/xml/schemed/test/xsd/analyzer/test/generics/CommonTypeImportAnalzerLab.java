// ============================================================================
// Copyright BRAINTRIBE TECHNOLOGY GMBH, Austria, 2002-2022
// 
// This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License along with this library; See http://www.gnu.org/licenses/.
// ============================================================================
package tribefire.extension.xml.schemed.test.xsd.analyzer.test.generics;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import tribefire.extension.xml.schemed.model.api.xsd.analyzer.api.model.SchemedXmlXsdAnalyzerRequest;
import tribefire.extension.xml.schemed.requestbuilder.xsd.test.util.TestUtil;
import tribefire.extension.xml.schemed.test.xsd.analyzer.test.AbstractXsdAnalyzerLab;

public class CommonTypeImportAnalzerLab extends AbstractXsdAnalyzerLab {
	private static File simple = new File( contents, "commonTypeImport");
	private static File input = new File( simple, "input");
	private static File output = new File( simple, "output");
	
	@BeforeClass
	public static void beforeClass() {
		TestUtil.ensure(output);
	}

	@Test
	public void flat_CommonTypeImport() {
		List<String> refs = new ArrayList<>();
		refs.add( "import.1.xsd");
		refs.add( "import.2.xsd");
		refs.add( "common.import.xsd");
		SchemedXmlXsdAnalyzerRequest request = buildPrimerRequest( input, "com.braintribe.simple.common.import.flat", "main.xsd", refs, "com.braintribe.xsd:CommonTypeImportFlatModel#1.0");		
		process( request, output);
	}
	@Test
	public void structured_CommonTypeImport() {
		List<String> refs = new ArrayList<>();
		refs.add( "import.1.xsd");
		refs.add( "import.2.xsd");
		refs.add( "common.import.xsd");
		SchemedXmlXsdAnalyzerRequest request = buildPrimerRequest( input, "com.braintribe.simple.common.import.structured", "main.xsd", refs, "com.braintribe.xsd:CommonTypeImportStructuredModel#1.0");
		request.setExposeChoice(true);
		request.setExposeSequence(true);
		process( request, output);
	}
}