$ ->
  window.disqus_shortname = 'sfreview'
  window.disqus_identifier = $('#pageid').text()
  do ->
    dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true
    dsq.src = '//' + window.disqus_shortname + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(dsq)