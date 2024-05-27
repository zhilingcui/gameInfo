package com.wymbmrj.mota.common.entity;


import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class Page {

	@NotNull
	@Min(value = 0)
	private int pageNumber;

	@NotNull
	@Min(value = 1)
	private int pageSize;
}
