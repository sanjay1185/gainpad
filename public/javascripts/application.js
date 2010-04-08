function toggleMetrics(elementId)
  {
    var theDiv=document.getElementById(elementId);
    var title=document.getElementById('pad_metric_title');
    var description=document.getElementById('pad_metric_description');
    var prefix=document.getElementById('pad_metric_prefix');
    var postfix=document.getElementById('pad_metric_postfix');
    title.value=''
    description.value=''
    prefix.value=''
    postfix.value=''

    if (theDiv.style.display=='none')
      theDiv.style.display = '';
    else
      theDiv.style.display = 'none';
  }