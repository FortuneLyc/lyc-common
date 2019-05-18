package com.act.common.spring.lang;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.type.classreading.CachingMetadataReaderFactory;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;

import com.act.common.other.filter.Filter;

/**
 * ClassName: ClassUtils <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月1日 下午4:39:22 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class ClassUtils {

	private static ResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
	private static MetadataReaderFactory metadataReaderFactory = new CachingMetadataReaderFactory(resourcePatternResolver);

	public static Set<Class<?>> findClass(String packagePath,Filter<Class<?>> filter) throws IOException {
		String packageSearchPath = ResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX +
				org.springframework.util.ClassUtils.convertClassNameToResourcePath(packagePath) + "/**/*.class";
		Resource[] resources = resourcePatternResolver.getResources(packageSearchPath);
		Set<Class<?>> results = new HashSet<>();
		for (Resource resource : resources) {
			if (resource.isReadable()) {
				MetadataReader metadataReader = metadataReaderFactory.getMetadataReader(resource);
				Class<?> clazz = null;
				try {
					clazz = Class.forName(metadataReader.getClassMetadata().getClassName());
				} catch (Throwable e) {
					continue;
				}
				if (filter.accept(clazz)) {
					results.add(clazz);
				}
			}
		}
		return results;
	}
}

