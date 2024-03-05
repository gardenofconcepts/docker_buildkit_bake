#!/usr/bin/env python

import click


@click.command()
@click.option('--token', envvar='MY_TOKEN', required=True)
def main(token):
    click.echo(f"Here is my top secret token: {token}!")


if __name__ == '__main__':
    main()
