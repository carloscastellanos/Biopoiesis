{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 88.0, 44.0, 1166.0, 648.0 ],
		"bglocked" : 0,
		"defrect" : [ 88.0, 44.0, 1166.0, 648.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open",
					"numinlets" : 2,
					"fontname" : "Arial",
					"id" : "obj-18",
					"numoutlets" : 1,
					"patching_rect" : [ 249.0, 128.0, 34.0, 18.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"id" : "obj-16",
					"numoutlets" : 1,
					"patching_rect" : [ 305.0, 127.0, 20.0, 20.0 ],
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sfrecord~",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-15",
					"numoutlets" : 1,
					"patching_rect" : [ 305.0, 163.0, 100.0, 20.0 ],
					"outlettype" : [ "signal" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"id" : "obj-14",
					"numoutlets" : 1,
					"patching_rect" : [ 303.0, 356.0, 20.0, 20.0 ],
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "dac~ 1 2 3 4",
					"numinlets" : 4,
					"fontname" : "Arial",
					"id" : "obj-3",
					"numoutlets" : 0,
					"patching_rect" : [ 329.0, 393.0, 77.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack 0. 0. 0.",
					"numinlets" : 3,
					"fontname" : "Arial",
					"id" : "obj-2",
					"numoutlets" : 1,
					"patching_rect" : [ 482.0, 455.0, 76.0, 20.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"slidercolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"numinlets" : 1,
					"bgcolor" : [ 0.145098, 0.07451, 0.376471, 1.0 ],
					"id" : "obj-1",
					"setstyle" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 482.0, 478.0, 211.0, 162.0 ],
					"size" : 3,
					"outlettype" : [ "", "" ],
					"spacing" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"maximum" : 22000.0,
					"numinlets" : 1,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Geneva",
					"minimum" : 10.0,
					"id" : "obj-86",
					"numoutlets" : 2,
					"patching_rect" : [ 392.0, 5.0, 52.0, 19.0 ],
					"triscale" : 0.9,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "saw~ 200",
					"numinlets" : 2,
					"fontname" : "Geneva",
					"id" : "obj-87",
					"numoutlets" : 1,
					"patching_rect" : [ 392.0, 29.0, 56.0, 19.0 ],
					"outlettype" : [ "signal" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"items" : [ "Menu", ",", "audio", ",", "sine", ",", "saw" ],
					"types" : [  ],
					"numinlets" : 1,
					"fontname" : "Geneva",
					"id" : "obj-110",
					"numoutlets" : 3,
					"patching_rect" : [ 266.0, 5.0, 53.0, 19.0 ],
					"outlettype" : [ "int", "", "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"maximum" : 22000.0,
					"numinlets" : 1,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"fontname" : "Geneva",
					"minimum" : 10.0,
					"id" : "obj-112",
					"numoutlets" : 2,
					"patching_rect" : [ 329.0, 5.0, 49.0, 19.0 ],
					"triscale" : 0.9,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "adc~",
					"numinlets" : 1,
					"fontname" : "Geneva",
					"id" : "obj-113",
					"numoutlets" : 2,
					"patching_rect" : [ 282.0, 29.0, 41.0, 19.0 ],
					"outlettype" : [ "signal", "signal" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cycle~ 200",
					"numinlets" : 2,
					"fontname" : "Geneva",
					"id" : "obj-114",
					"numoutlets" : 1,
					"patching_rect" : [ 329.0, 29.0, 59.0, 19.0 ],
					"outlettype" : [ "signal" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "selector~ 3",
					"numinlets" : 4,
					"fontname" : "Arial",
					"id" : "obj-78",
					"numoutlets" : 1,
					"patching_rect" : [ 266.0, 60.0, 145.0, 18.0 ],
					"outlettype" : [ "signal" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-81",
					"numoutlets" : 2,
					"patching_rect" : [ 87.0, 221.0, 50.0, 20.0 ],
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-80",
					"numoutlets" : 2,
					"patching_rect" : [ 457.0, 303.0, 50.0, 20.0 ],
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "FFT",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-77",
					"numoutlets" : 0,
					"patching_rect" : [ 146.0, 221.0, 50.0, 20.0 ],
					"fontface" : 3,
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-38",
					"numoutlets" : 2,
					"patching_rect" : [ 978.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-42",
					"numoutlets" : 1,
					"patching_rect" : [ 978.0, 281.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-45",
					"numoutlets" : 2,
					"patching_rect" : [ 927.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-46",
					"numoutlets" : 1,
					"patching_rect" : [ 927.0, 281.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-49",
					"numoutlets" : 2,
					"patching_rect" : [ 877.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-58",
					"numoutlets" : 1,
					"patching_rect" : [ 877.0, 281.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-59",
					"numoutlets" : 2,
					"patching_rect" : [ 827.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-60",
					"numoutlets" : 1,
					"patching_rect" : [ 827.0, 280.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-63",
					"numoutlets" : 2,
					"patching_rect" : [ 776.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-70",
					"numoutlets" : 1,
					"patching_rect" : [ 776.0, 281.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-71",
					"numoutlets" : 2,
					"patching_rect" : [ 726.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-72",
					"numoutlets" : 1,
					"patching_rect" : [ 726.0, 281.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-73",
					"numoutlets" : 2,
					"patching_rect" : [ 676.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-74",
					"numoutlets" : 1,
					"patching_rect" : [ 676.0, 281.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-75",
					"numoutlets" : 2,
					"patching_rect" : [ 626.0, 407.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-76",
					"numoutlets" : 1,
					"patching_rect" : [ 626.0, 280.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-20",
					"numoutlets" : 2,
					"patching_rect" : [ 975.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-26",
					"numoutlets" : 1,
					"patching_rect" : [ 975.0, 119.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-28",
					"numoutlets" : 2,
					"patching_rect" : [ 924.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-31",
					"numoutlets" : 1,
					"patching_rect" : [ 924.0, 119.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-33",
					"numoutlets" : 2,
					"patching_rect" : [ 874.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-34",
					"numoutlets" : 1,
					"patching_rect" : [ 874.0, 119.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-35",
					"numoutlets" : 2,
					"patching_rect" : [ 824.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-36",
					"numoutlets" : 1,
					"patching_rect" : [ 824.0, 118.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-13",
					"numoutlets" : 2,
					"patching_rect" : [ 773.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-17",
					"numoutlets" : 1,
					"patching_rect" : [ 773.0, 119.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p BandPass",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-12",
					"numoutlets" : 16,
					"patching_rect" : [ 623.0, 87.0, 437.0, 20.0 ],
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 221.0, 50.0, 881.0, 241.0 ],
						"bglocked" : 0,
						"defrect" : [ 221.0, 50.0, 881.0, 241.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-42",
									"numoutlets" : 0,
									"patching_rect" : [ 837.0, 206.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-43",
									"numoutlets" : 0,
									"patching_rect" : [ 773.0, 206.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-44",
									"numoutlets" : 0,
									"patching_rect" : [ 716.0, 206.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-45",
									"numoutlets" : 0,
									"patching_rect" : [ 658.0, 206.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-46",
									"numoutlets" : 0,
									"patching_rect" : [ 605.0, 207.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-47",
									"numoutlets" : 0,
									"patching_rect" : [ 551.0, 207.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-48",
									"numoutlets" : 0,
									"patching_rect" : [ 496.0, 207.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-49",
									"numoutlets" : 0,
									"patching_rect" : [ 435.0, 208.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-41",
									"numoutlets" : 0,
									"patching_rect" : [ 369.0, 206.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-40",
									"numoutlets" : 0,
									"patching_rect" : [ 315.0, 207.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-39",
									"numoutlets" : 0,
									"patching_rect" : [ 267.0, 207.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-38",
									"numoutlets" : 0,
									"patching_rect" : [ 212.0, 207.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-37",
									"numoutlets" : 0,
									"patching_rect" : [ 163.0, 206.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-32",
									"numoutlets" : 0,
									"patching_rect" : [ 117.0, 205.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-31",
									"numoutlets" : 0,
									"patching_rect" : [ 73.0, 205.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"id" : "obj-30",
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 204.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 20000 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-13",
									"numoutlets" : 1,
									"patching_rect" : [ 765.0, 109.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 16400 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-15",
									"numoutlets" : 1,
									"patching_rect" : [ 661.0, 110.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 12400 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-17",
									"numoutlets" : 1,
									"patching_rect" : [ 555.0, 111.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 8088.61 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-19",
									"numoutlets" : 1,
									"patching_rect" : [ 451.0, 112.0, 94.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 4622.06 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-21",
									"numoutlets" : 1,
									"patching_rect" : [ 345.0, 112.0, 95.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 3081.375 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-23",
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 113.0, 99.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 2054.25 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-25",
									"numoutlets" : 1,
									"patching_rect" : [ 136.0, 114.0, 94.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 1369.5 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-29",
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 114.0, 89.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 913 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-9",
									"numoutlets" : 1,
									"patching_rect" : [ 765.0, 39.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 608 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-11",
									"numoutlets" : 1,
									"patching_rect" : [ 661.0, 40.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 405 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-3",
									"numoutlets" : 1,
									"patching_rect" : [ 555.0, 41.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 270 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-5",
									"numoutlets" : 1,
									"patching_rect" : [ 451.0, 42.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 180 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-7",
									"numoutlets" : 1,
									"patching_rect" : [ 345.0, 42.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"patching_rect" : [ 3.0, 1.0, 25.0, 25.0 ],
									"outlettype" : [ "signal" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 120 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-36",
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 43.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 80 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-34",
									"numoutlets" : 1,
									"patching_rect" : [ 136.0, 44.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "reson~ 1. 40 10",
									"numinlets" : 4,
									"fontname" : "Arial",
									"id" : "obj-28",
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 44.0, 88.0, 17.0 ],
									"outlettype" : [ "signal" ],
									"fontsize" : 9.0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [ 774.5, 96.0, 441.0, 96.0, 441.0, 192.0, 378.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 354.5, 99.0, 231.0, 99.0, 231.0, 192.0, 172.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-38", 0 ],
									"hidden" : 0,
									"midpoints" : [ 460.5, 99.0, 231.0, 99.0, 231.0, 192.0, 221.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 99.0, 126.5, 99.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-31", 0 ],
									"hidden" : 0,
									"midpoints" : [ 145.5, 99.0, 120.0, 99.0, 120.0, 192.0, 82.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [ 564.5, 96.0, 339.0, 96.0, 339.0, 192.0, 276.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-49", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 189.0, 444.5, 189.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-30", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 99.0, 15.0, 99.0, 15.0, 189.0, 39.5, 189.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [ 145.5, 192.0, 505.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-47", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 192.0, 560.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-46", 0 ],
									"hidden" : 0,
									"midpoints" : [ 354.5, 192.0, 614.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-19", 0 ],
									"destination" : [ "obj-45", 0 ],
									"hidden" : 0,
									"midpoints" : [ 460.5, 192.0, 667.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-44", 0 ],
									"hidden" : 0,
									"midpoints" : [ 564.5, 192.0, 725.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [ 670.5, 192.0, 782.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 670.5, 96.0, 339.0, 96.0, 339.0, 192.0, 324.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 774.5, 27.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 354.5, 27.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 460.5, 27.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 249.5, 27.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 145.5, 27.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 564.5, 27.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 111.0, 39.5, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 39.0, 39.5, 39.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 132.0, 27.0, 132.0, 108.0, 145.5, 108.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 237.0, 27.0, 237.0, 105.0, 249.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 342.0, 27.0, 342.0, 105.0, 354.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-19", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 447.0, 27.0, 447.0, 105.0, 460.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 552.0, 27.0, 552.0, 105.0, 564.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 657.0, 27.0, 657.0, 102.0, 670.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 762.0, 27.0, 762.0, 102.0, 774.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 12.5, 27.0, 670.5, 27.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontname" : "Arial",
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontface" : 0,
						"globalpatchername" : "",
						"fontsize" : 12.0,
						"default_fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-51",
					"numoutlets" : 1,
					"patching_rect" : [ 502.0, 134.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"numinlets" : 2,
					"bgcolor" : [ 0.239216, 0.643137, 0.709804, 1.0 ],
					"id" : "obj-50",
					"numoutlets" : 2,
					"patching_rect" : [ 449.0, 128.0, 27.0, 140.0 ],
					"stripecolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"outlettype" : [ "signal", "int" ],
					"knobcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-47",
					"numoutlets" : 2,
					"patching_rect" : [ 723.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-48",
					"numoutlets" : 1,
					"patching_rect" : [ 723.0, 119.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-43",
					"numoutlets" : 2,
					"patching_rect" : [ 673.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-44",
					"numoutlets" : 1,
					"patching_rect" : [ 673.0, 119.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-37",
					"numoutlets" : 2,
					"patching_rect" : [ 623.0, 245.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-32",
					"numoutlets" : 1,
					"patching_rect" : [ 623.0, 118.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "bandpass filters",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-25",
					"numoutlets" : 0,
					"patching_rect" : [ 506.0, 87.0, 101.0, 20.0 ],
					"fontface" : 3,
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-11",
					"numoutlets" : 2,
					"patching_rect" : [ 237.0, 421.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-10",
					"numoutlets" : 1,
					"patching_rect" : [ 237.0, 295.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-9",
					"numoutlets" : 1,
					"patching_rect" : [ 117.0, 295.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-8",
					"numoutlets" : 2,
					"patching_rect" : [ 373.0, 225.0, 48.0, 17.0 ],
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pfft~ frequencyAnalyzer 1024 8",
					"numinlets" : 2,
					"fontname" : "Arial",
					"id" : "obj-7",
					"numoutlets" : 3,
					"patching_rect" : [ 8.0, 248.0, 339.0, 20.0 ],
					"color" : [ 0.478431, 0.709804, 0.317647, 1.0 ],
					"outlettype" : [ "signal", "signal", "signal" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-19",
					"numoutlets" : 2,
					"patching_rect" : [ 117.0, 421.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "interval $1",
					"numinlets" : 2,
					"fontname" : "Arial",
					"id" : "obj-21",
					"numoutlets" : 1,
					"patching_rect" : [ 373.0, 248.0, 56.0, 15.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"id" : "obj-22",
					"numoutlets" : 2,
					"patching_rect" : [ 8.0, 421.0, 48.0, 17.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-6",
					"numoutlets" : 1,
					"patching_rect" : [ 8.0, 295.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"numinlets" : 1,
					"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-5",
					"numoutlets" : 1,
					"patching_rect" : [ 44.0, 108.0, 20.0, 118.0 ],
					"outlettype" : [ "float" ],
					"bordercolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"numinlets" : 2,
					"bgcolor" : [ 0.239216, 0.643137, 0.709804, 1.0 ],
					"id" : "obj-4",
					"numoutlets" : 2,
					"patching_rect" : [ 8.0, 87.0, 27.0, 140.0 ],
					"stripecolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"outlettype" : [ "signal", "int" ],
					"knobcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-78", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-86", 0 ],
					"destination" : [ "obj-87", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [ 275.5, 107.0, 458.5, 107.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 275.5, 86.5, 17.5, 86.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 1 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 177.5, 283.0, 126.5, 283.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 17.5, 275.0, 338.5, 275.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 1 ],
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [ 177.5, 275.0, 357.833344, 275.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 2 ],
					"destination" : [ "obj-3", 2 ],
					"hidden" : 0,
					"midpoints" : [ 337.5, 278.0, 377.166656, 278.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 2 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 337.5, 281.0, 246.5, 281.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 1 ],
					"destination" : [ "obj-80", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [ 458.5, 278.0, 531.0, 278.0, 531.0, 124.0, 511.5, 124.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 458.5, 273.0, 613.0, 273.0, 613.0, 80.0, 632.5, 80.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 1 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 229.0, 84.0, 229.0, 84.0, 217.0, 96.5, 217.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 17.5, 238.0, 75.0, 238.0, 75.0, 103.0, 53.5, 103.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [ 17.5, 446.0, 491.5, 446.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 382.5, 289.0, 126.5, 289.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [ 382.5, 289.0, 17.5, 289.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 382.5, 289.0, 246.5, 289.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"midpoints" : [ 126.5, 446.0, 520.0, 446.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 312.5, 385.0, 338.5, 385.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 8 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 855.43335, 241.0, 609.0, 241.0, 609.0, 277.0, 635.5, 277.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 9 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [ 883.299988, 109.0, 660.0, 109.0, 660.0, 232.0, 645.0, 232.0, 645.0, 241.0, 609.0, 241.0, 609.0, 277.0, 685.5, 277.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 10 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [ 911.166687, 241.0, 972.0, 241.0, 972.0, 274.0, 735.5, 274.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 11 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [ 939.033325, 115.0, 954.0, 115.0, 954.0, 232.0, 972.0, 232.0, 972.0, 274.0, 785.5, 274.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 12 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 966.900024, 109.0, 960.0, 109.0, 960.0, 241.0, 972.0, 241.0, 972.0, 274.0, 836.5, 274.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 13 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [ 994.766663, 109.0, 960.0, 109.0, 960.0, 241.0, 972.0, 241.0, 972.0, 274.0, 886.5, 274.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 2 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [ 688.233337, 115.0, 732.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 14 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1022.633362, 232.0, 1035.0, 232.0, 1035.0, 277.0, 936.5, 277.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 660.366638, 115.0, 682.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 15 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1050.5, 277.0, 987.5, 277.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 4 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [ 743.966675, 115.0, 833.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 5 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [ 771.833313, 115.0, 883.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 6 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 799.700012, 115.0, 933.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 7 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 827.56665, 115.0, 984.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 3 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 716.099976, 115.0, 782.5, 115.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-78", 2 ],
					"hidden" : 0,
					"midpoints" : [ 338.5, 55.0, 359.5, 55.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-78", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 1 ],
					"destination" : [ "obj-78", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 0 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-2", 2 ],
					"hidden" : 0,
					"midpoints" : [ 246.5, 446.0, 548.5, 446.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
