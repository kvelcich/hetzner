from django.http import HttpResponse, Http404
from django.shortcuts import render


def main_page(request):
    return render(request, "main/index.html")


def demo_view(request):
    # Only allow HTMX requests
    if not request.headers.get('HX-Request'):
        raise Http404()

    return HttpResponse('<p class="text-green-600 font-semibold">HTMX is working! 🎉</p>')
