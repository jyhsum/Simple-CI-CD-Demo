"""Tests for demo."""
from django.urls import resolve
from django.test import SimpleTestCase
from health_check.views import health_check_view

# Create your tests here.
class Health_check(SimpleTestCase):
    """test for url."""

    def test_health_check_url(self):
        """test for url."""
        match = resolve('/health_check')

        self.assertEqual(match.route, 'health_check')
        self.assertEqual(
                    match.func.__code__,
                    health_check_view.as_view().__code__)

    def test_ealth_check_response_text(self):
        """test for response."""
        response = self.client.get('/health_check')
        self.assertContains(response, 'ok')