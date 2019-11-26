"""View class for demo."""
from django.shortcuts import render
from rest_framework.views import APIView
from django.http import HttpResponse

# Create your views here.
class hello_view(APIView):
    """hello View."""

    def get(self, request):
        """Return response."""
        return HttpResponse("ok")
 