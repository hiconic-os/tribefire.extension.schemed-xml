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
package tribefire.extension.xml.schemed.test.xsd.analyzer.test.fides.saaxml;

import java.io.File;

import org.junit.BeforeClass;
import org.junit.Test;

import tribefire.extension.xml.schemed.model.api.xsd.analyzer.api.model.SchemedXmlXsdAnalyzerRequest;
import tribefire.extension.xml.schemed.requestbuilder.builder.AnalyzerRequestBuilder;
import tribefire.extension.xml.schemed.requestbuilder.xsd.test.util.TestUtil;
import tribefire.extension.xml.schemed.test.xsd.analyzer.test.AbstractXsdAnalyzerLab;
import tribefire.extension.xml.schemed.test.xsd.analyzer.test.fides.HasFidesTokens;

public class SaaXmlLab extends AbstractXsdAnalyzerLab implements HasFidesTokens{
	private static final String TEST_MODEL = GRP_CREDIT_SUISSE_FOX + ":fox-envelope-model#" + VERSION_CREDIT_SUISSE_FOX;
	private static final String TEST_XSD = "SAA_XML_v2_0_2.xsd";
	private static String TEST_PACKAGE = "com.braintribe.model.fidesv.envelope";	
	private static File fides = new File( contents, "saa_xml");
	private static File input = new File( fides, "input");
	private static File output = new File( fides, "output");

	@BeforeClass
	public static void beforeClass() {
		TestUtil.ensure(output);
	}

	@Test
	public void flat_Full() {
		SchemedXmlXsdAnalyzerRequest request = AnalyzerRequestBuilder.request()
				.xsd()
				.file(new File( input, TEST_XSD))
			.close()
			.packageName( TEST_PACKAGE)
			.modelName( TEST_MODEL)
					
		.build();
		
		process( request, output);
	}
	
	
}
