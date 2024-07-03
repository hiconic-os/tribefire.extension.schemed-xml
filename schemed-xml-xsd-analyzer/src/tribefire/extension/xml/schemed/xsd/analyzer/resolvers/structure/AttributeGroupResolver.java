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
package tribefire.extension.xml.schemed.xsd.analyzer.resolvers.structure;

import java.util.ArrayList;
import java.util.List;

import com.braintribe.model.meta.GmProperty;

import tribefire.extension.xml.schemed.model.xsd.AttributeGroup;
import tribefire.extension.xml.schemed.xsd.analyzer.registry.context.SchemaMappingContext;
import tribefire.extension.xml.schemed.xsd.analyzer.registry.schema.commons.AnalyzerCommons;
import tribefire.extension.xml.schemed.xsd.analyzer.resolvers.ResolverCommons;

public class AttributeGroupResolver {

	public static List<GmProperty> resolve(SchemaMappingContext context, AttributeGroup group) {
		AttributeGroup actualGroup = AnalyzerCommons.retrieveAttributeGroup(context, group);
		context.currentEntityStack.push(actualGroup);
	
		try {
			List<GmProperty> properties = new ArrayList<>();			
			properties.addAll( ResolverCommons.processAttributes(context, actualGroup));
			properties.addAll( ResolverCommons.processAttributeGroups(context, actualGroup));
			
			return properties;
		}
		finally {
			context.currentEntityStack.pop();
		}		
	}

}
