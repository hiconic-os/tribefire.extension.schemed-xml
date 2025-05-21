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
package tribefire.extension.xml.schemed.test.roundtrip.ebxml;

import java.util.Arrays;

import org.junit.Test;
import org.junit.experimental.categories.Category;
import com.braintribe.testing.category.KnownIssue;

@Category(KnownIssue.class)
public class EbXmlLab extends AbstractEbXmlLab {

	private static final String MODEL_NAME = "com.braintribe.schemedxml.ebxml.invoice:ebxml-invoice#6.1";
	private static final String MAIN_XSD = "ebxml-6.1.xsd";
	private static final String PACKAGE_NAME = "com.braintribe.schemedxml.ebxml.invoice";
	private static final String MAIN_XML = "invoice-original.xml";
	
//
	@Test
	public void test() {		
		
		runRoundTrip(funds, PACKAGE_NAME, MAIN_XSD, Arrays.asList(MAIN_XML), MODEL_NAME, 110, 10);
	}
	
}
