"""Tests for demo."""
from django.urls import resolve
from django.test import SimpleTestCase, TestCase
from demo.views import hello_view
from django.apps import apps
from demo.apps import DemoConfig

# Create your tests here.
class UrlTest(SimpleTestCase):
    """test for url."""

    def test_demo_url(self):
        """test for url."""
        match = resolve('/hello')

        self.assertEqual(match.route, 'hello')
        self.assertEqual(
                    match.func.__code__,
                    hello_view.as_view().__code__)

class HelloTestStatusCode(TestCase):
    def test_status_code(self):
        response = self.client.get('/hello', follow=True)
        self.assertEqual(response.status_code, 200)

class DemoConfigTest(TestCase):
    def test_apps(self):
        self.assertEqual(DemoConfig.name, 'demo')
        self.assertEqual(apps.get_app_config('demo').name, 'demo')