function _check_form(label) {
  var i, total = 0;
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  var msg = "Please select at least one file or folder to " + label + ".";
  for (i=0; form.elements[i]; i++) {
    if ( form.elements[i].type == "checkbox" &&
      ( form.elements[i].name == "docs" ||
        form.elements[i].name == "dirs" ) &&
        form.elements[i].checked) {
      total++;
      if ( label != 'restore') return true;
    }
  }
  if ( label == 'restore') {
    if ( total == 1 ) return true;
    if ( total > 1 ) 
      msg = 'Please select only one file or folder to ' + label + '.';
    if ( !total ) 
      msg = 'Please select one file or folder to ' + label + '.';
  }
  if (label) {
    alert ( msg); 
    return false;
  }
}

function _submit_form(label) {
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  form.configSubmit.value = label;
  if ( _check_form(label))
    form.submit();
}

function _SelectAll(checked) {
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  var len = form.elements.length;
  var i;
  for (i=0; i < len; i++) {
    if (form.elements[i].name=='docs' ||
        form.elements[i].name=='dirs' ) {
      form.elements[i].checked=checked;
    }
  }
}

function _open_new(submit) {
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  var branch = form.branch.value;
  //var dir = _escape ( form.dir.value);
  dir = form.dir.value;
  var user = form.user.value;
  var cgi = form.cgi.value;
  window.open( "/wait.html","new","location=no,menubar=no,toolbar=no,scrollbars=yes,screenX=200,screenY=100,width=600,height=600,resizable=yes");
  form.target = 'new';
  form.dir.value = dir;
  form.configSubmit.value = submit;
  form.submit();
}

function _submit_new(submit) {
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  if ( _check_form(submit)) {
    //var dir = _escape ( form.dir.value);
    dir = form.dir.value;
    var os = form.os.value;

    var to_dirs = '';
    var to_docs = '';
    for (i=0; form.elements[i]; i++) {
      if ( form.elements[i].type == "checkbox" &&
        form.elements[i].name == "dirs" &&
        form.elements[i].checked) {
        if ( dir == '.' && ( submit == 'rename' || submit == 'delete' ||
                             submit == 'move')) {
          // some top folders should not be messed up
          var dir_name = form.elements[i].value;
          if ( dir_name == 'Private' || dir_name == 'Public' ||
            dir_name == 'www') {
            alert ( "Please do not "+submit+" folder of \""+dir_name+"\".");
            form.target = 'cmdfrm';
            form.dir.value = dir;
            form.configSubmit.value = 'tocommand';
            form.submit();
            return;
          }
        }
        if ( form.elements.length < 100)
          to_dirs = to_dirs + "&dirs=" + _escape ( form.elements[i].value);
      }
      if ( form.elements.length < 100)
        if ( form.elements[i].type == "checkbox" && 
             form.elements[i].name == "docs" && form.elements[i].checked) {
          to_docs = to_docs + "&docs=" + _escape ( form.elements[i].value);
        }
    }

    window.open( "/wait.html","new","location=no,menubar=no,toolbar=no,scrollbars=yes,screenX=200,screenY=100,width=600,height=500,resizable=yes");
    form.target = 'new';
    form.configSubmit.value = submit;
    form.submit();
  }
}

function _to_backup(submit) {
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  var branch = form.branch.value;
  //var dir = _escape ( form.dir.value);
  dir = form.dir.value;
  form.dir.value = dir + '/.snapshot';
  form.cmd.value = 1;
  form.target = 'basefrm';
  form.configSubmit.value = submit;
  form.submit();
}

function _open_review() {
  try {
    var form = parent.frames['basefrm'].document.file_form;
  } catch (e) {
    parent.frames['treefrm'].writeBasefrm ();
    var form = parent.frames['basefrm'].document.file_form;
  }
  var review_url = form.review_url.value;
  var target = form.target.value;
  window.open ( review_url, target);
}

function _escape ( name) {
  name = escape ( name);
  // to correct javascript escape bug to handle '+'
  var regexp = /\+/g;
  name = name.replace ( regexp, "%2b");
  return name;
}
