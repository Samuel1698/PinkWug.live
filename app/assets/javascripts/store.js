var buttons = document.querySelectorAll(".collection_button");
var	collection = document.querySelectorAll('.collection')

for (var i=0;i < buttons.length;i++){
	buttons[i].addEventListener("click", dropDown(buttons[i]));
}
detectCollection(buttons);

function dropDown(button){
	return function(){
		button.classList.add("active");
		for (let i=0; i < buttons.length; i++) {
			if (buttons[i] != button)
				buttons[i].classList.remove("active");
		}
		for (let i=0; i < collection.length; i++){
			//Reset the collection unless the id of the button clicked is the same as the collection class
			if (collection[i].classList.contains(button.id)){
				collection[i].classList.add("active");
				window.history.pushState("", "", '/shop?' + button.id);
			}
			else {
				collection[i].classList.remove("active");
			}
		}
	}
}
// Products collection
(function () {
  var scriptURL = 'https://sdks.shopifycdn.com/buy-button/latest/buy-button-storefront.min.js';
  if (window.ShopifyBuy) {
    if (window.ShopifyBuy.UI) {
      ShopifyBuyInit();
    } else {
      loadScript();
    }
  } else {
    loadScript();
  }
  function loadScript() {
    var script = document.createElement('script');
    script.async = true;
    script.src = scriptURL;
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(script);
    script.onload = ShopifyBuyInit;
  }
  function ShopifyBuyInit() {
    var client = ShopifyBuy.buildClient({
      domain: 'pinkwug.myshopify.com',
      storefrontAccessToken: 'e1e7a66f7b1c6ecb9040a917c6545b47',
    });
		var ui = ShopifyBuy.UI.init(client);
		var options_clothes = {
		  "product": {
		  	"styles": {
		  		"product": {

		  		}
		  	},
		    "buttonDestination": "modal",
		    "contents": {
		      "options": false,
		      "button": true,
		    },
		    "text": {
		    	"button": "clothes"
		    },
		    "events": {
		    	"afterRender": function(){
		    		fixCollectionBug();
		    		setTimeout(fixCollectionBug,500);
		    	},
		    },
		  },
		  "productSet": {
		  	"iframe": false
		  },
		  "modalProduct": {
		    "contents": {
		      "img": false,
		      "imgWithCarousel": true,
		      "button": false,
		      "buttonWithQuantity": true
		    },
		    "styles": {
		      "product": {
		        "@media (min-width: 601px)": {
		          "max-width": "100%",
		          "margin-left": "0px",
		          "margin-bottom": "0px"
		        }
		      },
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "button": "Add to cart"
		    }
		  },
		  "option": {},
		  "cart": {
		    "styles": {
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "total": "Subtotal",
		      "button": "Checkout"
		    }
		  },
		  "toggle": {
		    "styles": {
		      "toggle": {
		        "background-color": "#d2a2d6",
		        ":hover": {
		          "background-color": "#bd92c1"
		        },
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      },
		      "count": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000"
		        }
		      },
		      "iconPath": {
		        "fill": "#000000"
		      }
		    }
		  },
		  "window": {
		  	"height": "700",
		  	"width": "500"
		  }
		};
		var options_mugs = {
		  "product": {
		  	"styles": {
		  		"product": {

		  		}
		  	},
		    "buttonDestination": "modal",
		    "contents": {
		      "options": false,
		      "button": true,
		    },
		    "text": {
		    	"button": "mugs"
		    }
		  },
		  "productSet": {
		  	"iframe": false
		  },
		  "modalProduct": {
		    "contents": {
		      "img": false,
		      "imgWithCarousel": true,
		      "button": false,
		      "buttonWithQuantity": true
		    },
		    "styles": {
		      "product": {
		        "@media (min-width: 601px)": {
		          "max-width": "100%",
		          "margin-left": "0px",
		          "margin-bottom": "0px"
		        }
		      },
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "button": "Add to cart"
		    }
		  },
		  "option": {},
		  "cart": {
		    "styles": {
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "total": "Subtotal",
		      "button": "Checkout"
		    }
		  },
		  "toggle": {
		    "styles": {
		      "toggle": {
		        "background-color": "#d2a2d6",
		        ":hover": {
		          "background-color": "#bd92c1"
		        },
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      },
		      "count": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000"
		        }
		      },
		      "iconPath": {
		        "fill": "#000000"
		      }
		    }
		  },
		  "window": {
		  	"height": "700",
		  	"width": "500"
		  }
		};
		var options_stickers = {
		  "product": {
		  	"styles": {
		  		"product": {

		  		}
		  	},
		    "buttonDestination": "modal",
		    "contents": {
		      "options": false,
		      "button": true,
		    },
		    "text": {
		    	"button": "stickers"
		    }
		  },
		  "productSet": {
		  	"iframe": false
		  },
		  "modalProduct": {
		    "contents": {
		      "img": false,
		      "imgWithCarousel": true,
		      "button": false,
		      "buttonWithQuantity": true
		    },
		    "styles": {
		      "product": {
		        "@media (min-width: 601px)": {
		          "max-width": "100%",
		          "margin-left": "0px",
		          "margin-bottom": "0px"
		        }
		      },
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "button": "Add to cart"
		    }
		  },
		  "option": {},
		  "cart": {
		    "styles": {
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "total": "Subtotal",
		      "button": "Checkout"
		    }
		  },
		  "toggle": {
		    "styles": {
		      "toggle": {
		        "background-color": "#d2a2d6",
		        ":hover": {
		          "background-color": "#bd92c1"
		        },
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      },
		      "count": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000"
		        }
		      },
		      "iconPath": {
		        "fill": "#000000"
		      }
		    }
		  },
		  "window": {
		  	"height": "700",
		  	"width": "500"
		  }
		};
		var options_prints = {
		  "product": {
		  	"styles": {
		  		"product": {

		  		}
		  	},
		    "buttonDestination": "modal",
		    "contents": {
		      "options": false,
		      "button": true,
		    },
		    "text": {
		    	"button": "prints"
		    }
		  },
		  "productSet": {
		  	"iframe": false
		  },
		  "modalProduct": {
		    "contents": {
		      "img": false,
		      "imgWithCarousel": true,
		      "button": false,
		      "buttonWithQuantity": true
		    },
		    "styles": {
		      "product": {
		        "@media (min-width: 601px)": {
		          "max-width": "100%",
		          "margin-left": "0px",
		          "margin-bottom": "0px"
		        }
		      },
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "button": "Add to cart"
		    }
		  },
		  "option": {},
		  "cart": {
		    "styles": {
		      "button": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000",
		          "background-color": "#bd92c1"
		        },
		        "background-color": "#d2a2d6",
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      }
		    },
		    "text": {
		      "total": "Subtotal",
		      "button": "Checkout"
		    }
		  },
		  "toggle": {
		    "styles": {
		      "toggle": {
		        "background-color": "#d2a2d6",
		        ":hover": {
		          "background-color": "#bd92c1"
		        },
		        ":focus": {
		          "background-color": "#bd92c1"
		        }
		      },
		      "count": {
		        "color": "#000000",
		        ":hover": {
		          "color": "#000000"
		        }
		      },
		      "iconPath": {
		        "fill": "#000000"
		      }
		    }
		  },
		  "window": {
		  	"height": "700",
		  	"width": "500"
		  }
		};
		// Clothes collection
	  ui.createComponent('collection', {
	    id: '236021055661',
	    node: document.getElementById('collection-clothes'),
	    moneyFormat: '%24%7B%7Bamount%7D%7D',
	    options: options_clothes
	  });
	  // Mug collection
	  ui.createComponent('collection', {
	    id: '245363966125',
	    node: document.getElementById('collection-mugs'),
	    moneyFormat: '%24%7B%7Bamount%7D%7D',
	    options: options_mugs
	 	});
		// Sticker collection
		ui.createComponent('collection', {
		  id: '236021088429',
		  node: document.getElementById('collection-stickers'),
		  moneyFormat: '%24%7B%7Bamount%7D%7D',
		  options: options_stickers
		});
		// Print collection
		ui.createComponent('collection', {
		  id: '245427929261',
		  node: document.getElementById('collection-prints'),
		  moneyFormat: '%24%7B%7Bamount%7D%7D',
		  options: options_prints
		});
  }
})();

// Switch products from within category to corresponding one by button
function fixCollectionBug() {
	//Within x collection, find all products
	for (let i=0; i < collection.length; i++){
		var products = collection[i].querySelectorAll('.shopify-buy__product');
		for (let j=0; j < products.length; j++){
			text = products[j].querySelector('.shopify-buy__btn').innerText
			//If the product button text doesnt match the class of the collection
			if (!collection[i].classList.contains(text)) {
				matchProductToCollection(products[j], text);
			}
			products[j].querySelector('.shopify-buy__btn').innerText = ' ';
		}
	}
	detectCollection(collection);
	function matchProductToCollection(product, text) {
		// Check if each collection's class matches the text
		for (let i = 0; i < collection.length; i++){
			if (collection[i].classList.contains(text)){
				// Select the collection element that is a parent to the product
				parent = collection[i].querySelector('.shopify-buy__collection-products');
				parent.appendChild(product);
			}
		}
	};
};

// Detect url query  and make that collection active
function detectCollection(nodeList) {
	var url = window.location.search.substring(1);
	// console.log(url);
	if (url) {
		for (let i=0; i < collection.length; i++){
			if (collection[i].classList.contains(url)){
				nodeList[i].classList.add("active");
			}
		};
	}
	else {
		nodeList[0].classList.add("active");
	}
};
