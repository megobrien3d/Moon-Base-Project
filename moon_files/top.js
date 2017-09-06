function op() { //This function is used with folders that do not
                //open pages themselves. See online docs.
}

function submit_form_js ( submit, target, cmd, branch, dir) {
    var form = parent.frames['topfrm'].document.top_form;
    form.configSubmit.value = submit;
    form.target = target;
    form.cmd.value = cmd;
    form.branch.value = branch;
    form.dir.value = dir;
    form.submit();
}

function writeframe () {
  writeform();
  submit_form_js ( 'totree', 'treefrm', 1, '', '');
  submit_form_js ( 'todir', 'basefrm', 0, '', '');
}
