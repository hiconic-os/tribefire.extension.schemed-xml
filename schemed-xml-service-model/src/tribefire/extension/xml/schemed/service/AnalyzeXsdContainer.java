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
package tribefire.extension.xml.schemed.service;

import com.braintribe.model.generic.annotation.meta.Alias;
import com.braintribe.model.generic.annotation.meta.Description;
import com.braintribe.model.generic.annotation.meta.Mandatory;
import com.braintribe.model.generic.eval.EvalContext;
import com.braintribe.model.generic.eval.Evaluator;
import com.braintribe.model.generic.reflection.EntityType;
import com.braintribe.model.generic.reflection.EntityTypes;
import com.braintribe.model.resource.Resource;
import com.braintribe.model.service.api.ServiceRequest;

public interface AnalyzeXsdContainer extends AnalyzeXsdRequest {
	
	EntityType<AnalyzeXsdContainer> T = EntityTypes.T(AnalyzeXsdContainer.class);
	
	/** 
	 * @return - the name of the schema (aka the name of the ZipEntry in the container resource if a container is used)
	 */
	@Description("the name of the schema (aka the name of the ZipEntry in the container resource if a container is used)")
	@Alias("t")
	@Mandatory
	String getContainerTerminalSchemaUri();
	void setContainerTerminalSchemaUri( String name);
	
	/**  
	 * @return - the ZIP resource (of the container) 
	 */
	@Description("the ZIP resource (of the container)")
	@Alias("c")
	@Mandatory
	Resource getContainerResource();
	void setContainerResource( Resource resource);


	@Override
	EvalContext<? extends AnalyzedXsd> eval(Evaluator<ServiceRequest> evaluator);
	
}
