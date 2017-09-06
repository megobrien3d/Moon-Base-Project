function submit_form_treefrm ( submit, target, cmd, branch, dir) {
    var form = document.treefrm_form;
    form.configSubmit.value = submit;
    form.target = target;
    form.cmd.value = cmd;
    form.branch.value = branch;
    form.dir.value = dir;
    form.submit();
}
