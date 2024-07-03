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
package tribefire.extension.xml.schemed.requestbuilder.builder;

import tribefire.extension.xml.schemed.model.api.xsd.analyzer.api.model.SchemedXmlXsdAnalyzerRequest;
import tribefire.extension.xml.schemed.requestbuilder.builder.impl.AnalyzerRequestContext;

/**
 * a builder to build {@link SchemedXmlXsdAnalyzerRequest} instances to parameterize the SchemedXmlXsdAnalyer 
 * from schemed-xsd-xml-analyzer.
 * 
 * @author pit
 *
 */
public class AnalyzerRequestBuilder {

	/**
	 * start building a {@link SchemedXmlXsdAnalyzerRequest}
	 * @return - a {@link AnalyzerRequestContext} to work with
	 */
	public static AnalyzerRequestContext request() {
		return new AnalyzerRequestContext();
	}
}
