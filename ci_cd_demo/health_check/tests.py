"""Tests for demo."""
from django.urls import resolve
from django.test import SimpleTestCase, TestCase
from health_check.views import health_check_view
from django.apps import apps
from health_check.apps import HealthCheckConfig

# Create your tests here.
class Health_check_test(SimpleTestCase):
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

class Health_check_status_code(TestCase):
    def test_status_code(self):
        response = self.client.get('/health_check', follow=True)
        self.assertEqual(response.status_code, 200)


class HealthCheckConfigTest(TestCase):
    def test_apps(self):
        self.assertEqual(HealthCheckConfig.name, 'health_check')
        self.assertEqual(apps.get_app_config('health_check').name, 'health_check')