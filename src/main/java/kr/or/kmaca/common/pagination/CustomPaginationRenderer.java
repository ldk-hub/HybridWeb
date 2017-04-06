package kr.or.kmaca.common.pagination;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class CustomPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;
	
	public CustomPaginationRenderer() {
	
	}
	
	public void initVariables(){
		firstPageLabel    = "";
		previousPageLabel = "<li><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span></a></li>";
		currentPageLabel  = "<li class=\"active\"><a href=\"#\">{0}</a></li>";
		otherPageLabel    = "<li><a href=\"#\" target=\"_self\"  onclick=\"{0}({1});return false; \">{2}</a></li>";
		nextPageLabel     = "<li><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a></li>";
		lastPageLabel     = "";
	}

	
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
