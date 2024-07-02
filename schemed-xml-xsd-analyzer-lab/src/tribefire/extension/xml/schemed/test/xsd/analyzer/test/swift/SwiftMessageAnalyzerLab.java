// ============================================================================
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ============================================================================
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
package tribefire.extension.xml.schemed.test.xsd.analyzer.test.swift;

import java.io.File;

import org.junit.BeforeClass;
import org.junit.Test;

import tribefire.extension.xml.schemed.model.api.xsd.analyzer.api.model.SchemedXmlXsdAnalyzerRequest;
import tribefire.extension.xml.schemed.requestbuilder.xsd.test.util.TestUtil;
import tribefire.extension.xml.schemed.test.xsd.analyzer.test.AbstractXsdAnalyzerLab;

public class SwiftMessageAnalyzerLab extends AbstractXsdAnalyzerLab {
	private static File swift = new File( contents, "swift");
	private static File pain = new File( swift, "message");
	private static File input = new File( pain, "input");
	private static File output = new File( pain, "output");
	

	@BeforeClass
	public static void beforeClass() {
		TestUtil.ensure(output);
	}

	@Test
	public void testStructured() {
		SchemedXmlXsdAnalyzerRequest request = buildPrimerRequest( input, "com.braintribe.swift.msg", "SwiftMessage.xsd", java.util.Collections.emptyList(), "com.braintribe.xsd.swift:SwiftMessageStructuredModel#1.0");
		request.setExposeChoice(true);
		request.setExposeSequence(true);
		process( request, output);
	}
	@Test
	public void testFlattened() {
		SchemedXmlXsdAnalyzerRequest request = buildPrimerRequest( input, "com.braintribe.swift.msg", "SwiftMessage.xsd", java.util.Collections.emptyList(), "com.braintribe.xsd.swift:SwiftMessageFlatModel#1.0");		
		process( request, output);
	}

}
