package com.match.dto;

import java.util.List;

public class UpdateTagsDTO {

	private List<String> selectedTags;

	public List<String> getSelectedTags() {
		return selectedTags;
	}

	public void setSelectedTags(List<String> selectedTags) {
		this.selectedTags = selectedTags;
	}
}
