// ============================================================================
// Copyright BRAINTRIBE TECHNOLOGY GMBH, Austria, 2002-2022
//
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
package tribefire.extension.xml.schemed.xml.marshaller.test.generics.simple.choices;

import java.io.File;

import org.junit.Assert;
import org.junit.Test;

import com.braintribe.model.generic.GenericEntity;
import com.braintribe.utils.IOTools;

import tribefire.extension.xml.schemed.model.api.xml.marshaller.api.model.SchemedXmlMarshallerMarshallRequest;
import tribefire.extension.xml.schemed.model.api.xml.marshaller.api.model.SchemedXmlMarshallerMarshallResponse;
import tribefire.extension.xml.schemed.model.api.xml.marshaller.api.model.SchemedXmlMarshallerUnmarshallRequest;
import tribefire.extension.xml.schemed.model.api.xml.marshaller.api.model.SchemedXmlMarshallerUnmarshallResponse;
import tribefire.extension.xml.schemed.test.commons.xsd.test.util.TestUtil;
import tribefire.extension.xml.schemed.xml.marshaller.test.AbstractXmlMarshallerLab;

public class SimpleChoicesStructuredLab extends AbstractXmlMarshallerLab {
	private static final String CHOICE_A_XML = "choice.a.xml";
	private static final String CHOICE_B_XML = "choice.b.xml";
	private static final String COM_BRAINTRIBE_XSD_SIMPLE_STRUCTURED_MODEL_MAPPING_MODEL_XML = "com.braintribe.xsd.SimpleChoiceStructuredModel-mapping.model.xml";
	private File contents = new File(res, "generics");
	private File simple = new File( contents, "simpleChoice/structured");
	private File input = new File( simple, "input");
	private File output = new File( simple, "output");
	
	
	private void test(String xml) {
		try {
			SchemedXmlMarshallerUnmarshallRequest umRequest = buildRequest(input, xml, COM_BRAINTRIBE_XSD_SIMPLE_STRUCTURED_MODEL_MAPPING_MODEL_XML);
			SchemedXmlMarshallerUnmarshallResponse umResponse = process( umRequest);
			GenericEntity result = umResponse.getAssembly();
			System.out.println(result);
			
			SchemedXmlMarshallerMarshallRequest mRequest = buildRequest(input, result, COM_BRAINTRIBE_XSD_SIMPLE_STRUCTURED_MODEL_MAPPING_MODEL_XML);
			SchemedXmlMarshallerMarshallResponse mResponse = process( mRequest);
			TestUtil.ensure(output);
			File xmlOutputFile = new File( output, xml);
			IOTools.spit( xmlOutputFile, mResponse.getExpression(), "UTF-8", false);
			
			File xsdInputFile = new File( input, "simple.xsd");
			
			boolean validationResult = validate(xsdInputFile, xmlOutputFile);
			Assert.assertTrue( "output doesn't validate", validationResult);;
			
		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail( "Exception [" + e.getMessage() + "] thrown");
		}
	}
	
	//@Test
	public void testA() {
		test( CHOICE_A_XML);
	}

	//@Test
	public void testB() {
		test( CHOICE_B_XML);
	}
}
