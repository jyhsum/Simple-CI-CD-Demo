"""View class for demo."""
from rest_framework.views import APIView
from django.http import HttpResponse


class hello_view(APIView):
    """hello View."""

    def get(self, request):
        """Return response."""

        return HttpResponse("ok")
