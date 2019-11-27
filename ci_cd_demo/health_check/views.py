"""View class for health check."""
from rest_framework.views import APIView
from django.http import HttpResponse


class health_check_view(APIView):
    """health check View."""

    def get(self, request):
        """Return response."""

        return HttpResponse("ok")
