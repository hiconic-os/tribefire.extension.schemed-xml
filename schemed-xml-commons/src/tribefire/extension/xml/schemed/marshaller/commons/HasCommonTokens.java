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
package tribefire.extension.xml.schemed.marshaller.commons;

public interface HasCommonTokens {
	static final String MODEL_NAME_ROOT_MODEL = "com.braintribe.gm:root-model";

	static final String SCHEMED_XML_ROOT = "tribefire.extension.schemed-xml";
	static final String PACKAGE_STANDARD_XML_TYPES = "tribefire.extension.xml.schemed.model.standards";
	static final String MODEL_NAME_STANDARD_XML_TYPES = SCHEMED_XML_ROOT + ":schemed-xml-standards-model";
	static final String MODEL_NAME_MAPPING_MODEL = SCHEMED_XML_ROOT + ":schemed-xml-xsd-mapping-model";
	static final String MODEL_VERSION_STANDARD_XML_TYPES = "1.0.1";
	
	static final String [] types = new String [] {"NMTOKEN", "language", "TOKEN", "normalizedString", "NCName", "ID", "IDREF", "AnyAttribute", "AnyType"};
	

}
