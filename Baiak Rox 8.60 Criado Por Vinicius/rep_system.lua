ElementsByClassName = ajaxSuggestions.elmByClass;
			}
			var results = ajaxSuggestions.elmToPresentResultsIn.getElementsByClassName(ajaxSuggestions.itemClassName);
      var selectedItem =selectedIndex;
			if(results.length > 0){
				var item;
				var classToRemove;
				for(var i=0; i<results.length; i++){
					item = results[i];
					classToRemove = new RegExp((ajaxSuggestions.itemSelectedClassName + "\s?"), "i");
					item.className = item.className.replace(classToRemove, "").replace(/^\s?|\s?$/g, "");
				};
				ajaxSuggestions.selectedItem = selectedItem;
				var elmToFocus = ajaxSuggestions.currentElm;
				if(selectedItem > -1){
					var currentItem = results[selectedItem];
					var currentClass = item.className;
					if(!new RegExp(ajaxSuggestions.itemSelectedClassName, "i").test(currentClass)){
						currentItem.className = currentClass + ((currentClass.length > 0)? " " : "") + ajaxSuggestions.itemSelectedClassName;
					}
					elmToFocus = results[selectedItem];
//          for(var i=0; i<ajaxSuggestions.elements.length; i++){
//            ajaxSuggestions.elements[i].value=currentItem.innerHTML;
//            ajaxSuggestions.elements[i].focus();
//            break;
//          }
        }
//				try{
//					elmToFocus.focus();
//				}
//				catch(e){
//					 Just in case... :-)
//				}
				if(event){
					if(event.preventDefault){
						event.preventDefault();
					}
					else{
						event.returnValue = false;
					}
					if(event.stopPropagation){
						event.stopPropagation();
					}
					else{
						event.cancelBubble = true;
					}
				}
				return false;
			}
			else if(keyCode == 27){
				ajaxSuggestions.clearResults();
				try{
					ajaxSuggestions.currentElm.focus();
				}
				catch(e){
					// Just in case... :-)
				}
			}
		}
	},

	applyResultEvents : function (){
		if(typeof this.elmToPresentResultsIn.getElementsByClassName != "function"){
			this.elmToPresentResultsIn.getElementsByClassName = this.elmByClass;
		}
		var insertValueItems = this.elmToPresentResultsIn.getElementsByClassName(this.itemInsertValueIntoInputClassName, "a");
		var item;
		for(var i=0; i<insertValueItems.length; i++){
			item = insertValueItems[i];
			item.inputRef = this.currentElm;
			this.addEvent(item, "click", this.insertValueIntoField);
		};		
	},
	
	insertValueIntoField : function (evt){
		var elm = (/a/i.test(this.nodeName))? this : evt.srcElement;
		var input = elm.inputRef;
		var value = elm.getAttribute("href");
		if(!new RegExp(value).test(input.value)){
			input.value = ((input.value.length > 0 && /;/i.test(input.value))? (input.value + value) : value) + ajaxSuggestions.itemSeparator;
		}
		if(evt.preventDefault){
			evt.preventDefault();
		}
		else{
			evt.returnValue = false;
		}
		if(evt.stopPropagation){
			evt.stopPropagation();
		}
		else{
			evt.cancelBubble = true;
		}
		if(ajaxSuggestions.itemInsertValueSetFocusToInput){
			try{
				input.focus();
			}
			catch(e){
				// Just in case... :-)
			}
		}
		if(ajaxSuggestions.hideResultsWhenInsertValueIsSelected){
			ajaxSuggestions.clearResults();
		}
		ajaxSuggestions.valueAddedFromResultsListToInput = true;
	},
	
	preventInputClickBubbling : function (evt){
		if(evt.preventDefault){
			evt.preventDefault();
		}
		else{
			evt.returnValue = false;
		}
		if(evt.stopPropagation){
			evt.stopPropagation();
		}
		else{
			evt.cancelBubble = true;
		}
		return false;
	},
	
	preventDefaultForArrowKeys : function (evt){
    var keyCode = evt.keyCode;
		var navigateUp = keyCode == 38;
		var navigateDown = keyCode == 40;
		if((!evt.ctrlKey && !evt.metaKey) && ajaxSuggestions.resultsAreVisible && (navigateUp || navigateDown)){
			if(evt.preventDefault){
				evt.preventDefault();
			}
			else{
				evt.returnValue = false;
			}
			if(evt.stopPropaga