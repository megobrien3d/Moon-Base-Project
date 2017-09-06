// For use in ifs_home_base.tmpl and base.html
function check_form(label) {
    var i, total = 0;
    var msg = "Please select at least one file or folder to " + label + ".";
    for (i=0; document.file_form.elements[i]; i++) {
        if (document.file_form.elements[i].type == "checkbox" &&
            ( document.file_form.elements[i].name == "docs" ||
              document.file_form.elements[i].name == "dirs" ) &&
            document.file_form.elements[i].checked) {
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
    }
}

function submit_form(label) {
    document.file_form.configSubmit.value = label;
    if ( check_form(label))
        document.file_form.submit();
}

function SelectAll(checked) {
    var len = document.file_form.elements.length;
    var i;
    for (i=0; i < len; i++) {
        if (document.file_form.elements[i].name=='docs' ||
            document.file_form.elements[i].name=='dirs' ) {
            document.file_form.elements[i].checked=checked;
        }
    }
}

// change directory
function cd ( to_path, cmd) {
    to_path = Escape ( to_path);
    document.file_form.dir.value = to_path;
    document.file_form.cmd.value = cmd;
    document.file_form.configSubmit.value = 'todir';
    document.file_form.target = 'basefrm';
    document.file_form.submit();
}

// to file 
function cf ( to_dir, file_name) {
    to_dir = Escape ( to_dir);
    file_name = Escape ( file_name);
    document.file_form.dir.value = to_dir;
    document.file_form.doc.value = file_name;
    document.file_form.configSubmit.value = 'tofile';
    document.file_form.target = 'new';
    document.file_form.submit();
}

// to .pdf file - problem to POST large size of .pdf file
function cf_get ( to_dir, file_name) {
    to_dir = Escape ( to_dir);
    file_name = Escape ( file_name);
    cgi = document.file_form.cgi.value;
    branch = document.file_form.branch.value;
    user = document.file_form.user.value;
    url = cgi+'?submit=tofile&branch='+branch+'&dir='+to_dir+'&user='+user+'&doc='+file_name;
    window.open ( url, 'new');
}

// uncompress 
function uc ( to_dir, file_name) {
    msg = "----------------------------------\n" +
          "        Uncompress/Expand \n" +
          "----------------------------------\n\n" +
          "Click 'OK' to uncompress the file,        \n" +
          "or click 'Cancel' to download.\n\n";
    to_dir = Escape ( to_dir);
    file_name = Escape ( file_name);
    document.file_form.dir.value = to_dir;
    document.file_form.doc.value = file_name;
    if ( confirm ( msg)) {
        document.file_form.configSubmit.value = 'uncompress';
        document.file_form.target = 'basefrm';
        document.file_form.submit();
    } else {
        document.file_form.configSubmit.value = 'tofile';
        document.file_form.target = 'new';
        document.file_form.submit();
    }
}

// text edit
function ed_text ( to_dir, file_name) {
    msg = "---------------------------\n" +
          "        TEXT EDITOR \n" +
          "---------------------------\n\n" +
          "Click 'OK' to edit the file, or        \n" +
          "click 'Cancel' to view it.\n\n";
    to_dir = Escape ( to_dir);
    file_name = Escape ( file_name);
    if ( confirm ( msg))
        submit = 'text_edit';
    else
        submit = 'tofile';
    document.file_form.dir.value = to_dir;
    document.file_form.doc.value = file_name;
    document.file_form.configSubmit.value = submit;
    document.file_form.target = 'new';
    document.file_form.submit();
}

// html edit
function ed_html ( to_dir, file_name) {
    msg = "---------------------------\n" +
          "        HTML EDITOR \n" +
          "---------------------------\n\n" +
          "Click 'OK' to edit the file, or        \n" +
          "click 'Cancel' to view it.\n\n";
    to_dir = Escape ( to_dir);
    file_name = Escape ( file_name);
    if ( confirm ( msg))
        submit = 'html_edit';
    else
        submit = 'tofile';
    document.file_form.dir.value = to_dir;
    document.file_form.doc.value = file_name;
    document.file_form.configSubmit.value = submit;
    document.file_form.target = 'new';
    document.file_form.submit();
}

function Escape ( name) {
    name = escape ( name);
    // to correct javascript escape bug to handle '+'
    var regexp = /\+/g;
    name = name.replace ( regexp, "%2b");
    return name; 
}

function submit_form_base ( label, target, cmd, branch, dir) {
    document.file_form.configSubmit.value = label;
    document.file_form.cmd.value = cmd;
    document.file_form.branch.value = branch;
    document.file_form.dir.value = dir;
    document.file_form.target = target;
    document.file_form.submit();
}

function sort ( branch, dir, sortby, orderby) {
    document.file_form.configSubmit.value = 'sort';
    document.file_form.cmd.value = 0;
    document.file_form.target = 'basefrm';
    document.file_form.branch.value = branch;
    document.file_form.dir.value = dir;
    document.file_form.sortby.value = sortby;
    document.file_form.orderby.value = orderby;
    document.file_form.submit();
}
