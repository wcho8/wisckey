/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language = 'ko';
	config.toolbar = [['NewPage','Preview','-','Cut','Copy','Paste','PasteText','-','Print','-'],
	                 ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
					 ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Source'],
	                 ['Bold','Italic','Underline','Strike','-','Subscript','Superscript','NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	                 ['Link','Unlink','-','Image','Table','HorizontalRule','Smiley','SpecialChar'],
	                 '/',
	                 ['Styles','Format','Font','Fontsize','TextColor','BGColor','Maximize',]];
	config.styleSet = [{element: 'blockquote', attributes: {'class':'blockquote'}}]
};
