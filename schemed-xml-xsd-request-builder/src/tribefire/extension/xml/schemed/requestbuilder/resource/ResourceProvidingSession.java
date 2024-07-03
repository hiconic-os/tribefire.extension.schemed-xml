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
package tribefire.extension.xml.schemed.requestbuilder.resource;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import com.braintribe.model.generic.manipulation.Manipulation;
import com.braintribe.model.generic.session.GmSession;
import com.braintribe.model.processing.session.api.resource.ResourceAccess;
import com.braintribe.model.processing.session.api.resource.ResourceCreateBuilder;
import com.braintribe.model.processing.session.api.resource.ResourceDeleteBuilder;
import com.braintribe.model.processing.session.api.resource.ResourceRetrieveBuilder;
import com.braintribe.model.processing.session.api.resource.ResourceUpdateBuilder;
import com.braintribe.model.processing.session.api.resource.ResourceUrlBuilder;
import com.braintribe.model.processing.session.impl.session.AbstractGmSession;
import com.braintribe.model.resource.Resource;
import com.braintribe.model.resource.api.HasResourceReadAccess;
import com.braintribe.model.resource.api.ResourceReadAccess;
import com.braintribe.model.resource.source.FileSystemSource;
import com.braintribe.model.resource.source.ResourceSource;

/**
 * a simple {@link GmSession} that can implement the {@link #openStream(Resource)} method for the resources 
 * it has created. 
 * 
 * @author pit
 * @deprecated TODO: Use BasicResourceAccess instead
 */
@Deprecated
public class ResourceProvidingSession extends AbstractGmSession implements ResourceAccess, HasResourceReadAccess {

	@Override
	public void noticeManipulation(Manipulation manipulation) {		
	}

	@Override
	public ResourceUrlBuilder url(Resource resource) {
		return null;
	}

	@Override
	public ResourceUpdateBuilder update(Resource resource) {
		return null;
	}
	
	@Override
	public ResourceCreateBuilder create() {
		return null;
	}

	@Override
	public ResourceRetrieveBuilder retrieve(Resource resource) {
		return null;
	}

	@Override
	public ResourceDeleteBuilder delete(Resource resource) {
		return null;
	}

	@Override
	public InputStream openStream(Resource resource) throws IOException {
		ResourceSource resourceSource = resource.getResourceSource();
		if (resourceSource instanceof FileSystemSource) {
			FileSystemSource filesystemSource = (FileSystemSource) resourceSource;
			File file = new File( filesystemSource.getPath());
			return new FileInputStream(file);			
		}
		throw new IllegalArgumentException("resource source [" + resourceSource.getClass().getName() + "] is not supported");
	}

	
	@Override
	public ResourceReadAccess resources() {
		return this;
	}


	
}
